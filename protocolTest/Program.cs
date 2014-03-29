using System;
using System.Threading;

namespace protocolTest
{
	class MainClass
	{
		public static void Main (string[] args)
		{
			Console.WriteLine ("Tr2 Protocol Testing");

			using (var controller = new Tr2Controller ("/dev/ttyUSB0"))
			{
				controller.Open ();

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

				controller.RawSpiMotorCommand (0, new byte[] { 1, 3, 88, 20 });
			}
		}
	}
}
