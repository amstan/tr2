using System;
using System.Collections;
using System.Text.RegularExpressions;
using System.Collections.Generic;

namespace bomParser
{
	public class RefComparer : IComparer<string>
	{
		public int Compare(string a, string b)
		{
			var aMatch = Regex.Match ((string)a, "([A-Za-z]+)([0-9]+)");
			var bMatch = Regex.Match ((string)b, "([A-Za-z]+)([0-9]+)");

			var strCmp = string.Compare (aMatch.Groups [1].Value, bMatch.Groups [1].Value);

			if (strCmp != 0) {
				return strCmp;
			} else {
				try {
					var aWeight = Convert.ToInt32 (aMatch.Groups [2].Value);
					var bWeight = Convert.ToInt32 (bMatch.Groups [2].Value);

					if (bWeight > aWeight) {
						return -1;
					} else if (bWeight < aWeight) {
						return 1;
					} else {
						return 0;
					}
				} catch(FormatException) {
					return 0;
				}
			}
		}
	}
}

