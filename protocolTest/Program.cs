using System;
using System.Threading;

namespace protocolTest
{
	class MainClass
	{
		public static void Main (string[] args)
		{
			Console.WriteLine ("Tr2 Protocol Testing");

			Console.CancelKeyPress += (object sender, ConsoleCancelEventArgs e) => {
				Console.WriteLine("Control C received!");
				e.Cancel = true;
			};

			using (var controller = new Tr2Controller ("/dev/ttyUSB0"))
			{
				controller.Open ();

				for (int i = 0; i <= 255; i++)
				{
					controller.SetWs2812Range (0, 0, 30, (byte)0, (byte)0, (byte)i);
				}

				for (int i = 0; i < Tr2Controller.NumberOfLeds; i++)
				{
					controller.EnableLed (i);
					Thread.Sleep (100);
				}

				for (int i = 0; i < Tr2Controller.NumberOfLeds; i++)
				{
					controller.DisableLed (i);
					Thread.Sleep (100);
				}

				for (int i = 0; i < Tr2Controller.NumberOfLeds; i++)
				{
					controller.ToggleLed (i);
					Thread.Sleep (100);
				}

				controller.DisableLed (0);
				controller.DisableLed (2);

				for (int i = 255; i >= 0; i--)
				{
					controller.SetWs2812Range (0, 0, 30, (byte)0, (byte)i, (byte)0);
				}
			}
		}
	}
}
