using System;

namespace protocolTest
{
	public enum MessageClass : byte
	{
		Nop,
		Protocol,
		UserLed,
		MotorDriver,
		Ws2812
	}
}

