using System;
using System.Xml;
using System.IO;
using System.Linq;
using System.Xml.Linq;

namespace bomParser
{
	class MainClass
	{
		public static void Main (string[] args)
		{
            if (args.Count () == 0 || args [0] == "--help") {
                Console.WriteLine ("BOM Parser");
                Console.WriteLine ();
                Console.WriteLine ("Usage: [--help] [--blankpartsonly] bomfile");
                Console.WriteLine ();
                Console.WriteLine (
@"This utility parses the XML BOM output from Kicad and performs various
operations on the data.");
                Console.WriteLine ();
                Console.WriteLine ("--help              Print this message");
                Console.WriteLine ("--blankpartsonly    Print parts with no Part Number field");
                Console.WriteLine ("bomfile             XML file with BOM contents");

                if (args.Count () == 0) {
                    Console.WriteLine ();
                    Console.WriteLine ("You must specify a BOM file.");
                }

                return;
            }

            XDocument xdoc = null;
            var bomFile = args.Last ();
            var blankPartsOnly = false;

            if (args.Count () > 1) {
                blankPartsOnly = args [args.Count () - 2] == "--blankpartsonly";
            }

            try {
                xdoc = XDocument.Load (bomFile);
            } catch (Exception) {
                Console.WriteLine ("There was a problem loading the BOM file.");
                return;
            }

            var comparer = new RefComparer();

            var components =
                from c in xdoc.Descendants ("components").Descendants ("comp")
                select new {
                    ReferenceDesignator = c.Attribute ("ref").Value,
                    Value = c.Descendants ("value").First ().Value,
                    PartNumber = (from p in c.Descendants ("field")
                                  where p.Attribute ("name").Value == "Part Number"
                                  select p.Value).FirstOrDefault ()
                };

            components =
                components.OrderBy(i => i.ReferenceDesignator, comparer);

            var componentGroups =
                from c in components
                where !blankPartsOnly || String.IsNullOrEmpty(c.PartNumber)
                group c by new { c.PartNumber, c.Value } into cg
                select new {
                    PartNumber = cg.First ().PartNumber,
                    Value = cg.First ().Value,
                    Designators = cg.Select (i => i.ReferenceDesignator).ToList (),
                    Count = cg.Count ()
                };

            foreach (var component in componentGroups)
            {
                Console.WriteLine ("Part Number: {0} http://www.digikey.ca/product-search/en?vendor=0&keywords={1}", component.PartNumber, component.PartNumber);
                Console.WriteLine ("Value: {0}", component.Value);
                Console.Write ("References: ");

                component.Designators.Sort (comparer);

                foreach (var c in component.Designators) {
                    Console.Write ("{0} ", c);
                }

                Console.WriteLine ();
                Console.WriteLine ();
            }
		}
	}
}
