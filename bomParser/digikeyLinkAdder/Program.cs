using System;
using System.Linq;
using System.IO;
using System.Text.RegularExpressions;

namespace digikeyLinkAdder
{
    class MainClass
    {
        public static void Main (string[] args)
        {
            if (args.Count () == 0 || args [0] == "--help") {
                Console.WriteLine ("Digikey Link Adder");
                Console.WriteLine ();
                Console.WriteLine ("Usage: [--help] schematicfile");
                Console.WriteLine ();
                Console.WriteLine (
@"This utility parses the kicad schematic file and adds Digikey Part fields as
well as a link to the Digikey page in the datasheet. Renames the original file
with a .bak.guid extension.");
                Console.WriteLine ();
                Console.WriteLine ("--help              Print this message");
                Console.WriteLine ("schematicfile       Kicad Schematic");

                if (args.Count () == 0) {
                    Console.WriteLine ();
                    Console.WriteLine ("You must specify a BOM file.");
                }

                return;
            }

            var schematicFile = args.Last ();
            var origFile = schematicFile + ".bak." + Guid.NewGuid().ToString();

            File.Copy (schematicFile, origFile);

            var schReader = new StreamReader (origFile);
            var schWriter = new StreamWriter (schematicFile);

            while (!schReader.EndOfStream) {
                var datasheetLine = schReader.ReadLine ();
                var linkField = Regex.Match (datasheetLine, @"F 3 ""{1}.*""{1}.*");
                if (linkField.Success) {
                    var partNumberLine = schReader.ReadLine ();
                    var partNumber = Regex.Match(partNumberLine, @"(.*""{1})(.*)(""{1}.*""Part Number""{1})");
                    if (partNumber.Success) {
                        Console.WriteLine ("Part Number: {0}", partNumber.Groups [2].Value);
                        Console.WriteLine ("Suggested Link: http://www.digikey.ca/product-search/en?vendor=0&keywords={0}", partNumber.Groups [2].Value);

                        Console.WriteLine ("Digikey Part Number:");
                        var digiPartNumber = Console.ReadLine ();

                        var digiPartNumberLine = string.Format (@"F 4 ""{0}"" H 6900 4550 60  0001 C CNN ""Digikey Number""", digiPartNumber);

                        Console.WriteLine ("Digikey Link:");
                        var datasheetLink = Console.ReadLine ();
                        datasheetLine = Regex.Replace (datasheetLine, "\"\"", "\"" + datasheetLink + "\"");
                        datasheetLine = Regex.Replace (datasheetLine, "0000 C CNN", "0001 C CNN");

                        schWriter.WriteLine (datasheetLine);
                        schWriter.WriteLine (partNumberLine);
                        schWriter.WriteLine (digiPartNumberLine);
                    } else {
                        schWriter.WriteLine (datasheetLine);
                        schWriter.WriteLine (partNumberLine);
                    }
                } else {
                    schWriter.WriteLine (datasheetLine);
                }
            }

            schReader.Dispose ();
            schWriter.Dispose ();
        }
    }
}
