﻿using System;
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
			var bomXml = args [0];
			var reader = XDocument.Load (bomXml);

			var components = from c in reader.Descendants ("components").Descendants ("comp")
			                 select new {
								 ReferenceDesignator = c.Attribute ("ref").Value,
							  	 Value = c.Descendants ("value").First ().Value,
							     PartNumber = (from p in c.Descendants ("field")
							                   where p.Attribute ("name").Value == "Part Number"
								               select p.Value).FirstOrDefault ()
								};

			var componentGroups = from c in components
				where string.IsNullOrEmpty(c.PartNumber)
				orderby c.Value
									group c by new { c.PartNumber, c.Value } into cg
				
			                      select new {
				PartNumber = cg.First().PartNumber,
				Value = cg.First().Value,
				Designators = cg.Select(i => i.ReferenceDesignator).ToList(),
				Count = cg.Count()
			};

			foreach (var component in componentGroups)
			{
				Console.WriteLine ("Part Number: {0}", component.PartNumber);
				Console.WriteLine ("Value: {0}", component.Value);
				Console.Write ("References: ");

				foreach (var c in component.Designators) {
					Console.Write ("{0} ", c);
				}

				Console.WriteLine ();
				Console.WriteLine ();
			}
		}
	}
}