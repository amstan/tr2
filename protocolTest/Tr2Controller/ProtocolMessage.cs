using System;

namespace protocolTest
{
	public enum ProtocolMessage : byte
	{
		Nop,
		BadCrc,
		Acknowledge,
		NegativeAcknowledge,
		InvalidMessageClass
	}
}

