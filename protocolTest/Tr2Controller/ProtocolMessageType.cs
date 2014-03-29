using System;

namespace protocolTest
{
	public enum ProtocolMessageType : byte
	{
		Nop,
		BadCrc,
		Acknowledge,
		NegativeAcknowledge,
		InvalidMessageClass
	}
}

