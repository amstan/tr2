using System;

namespace protocolTest
{
	public enum ProtocolMessageType : byte
	{
		BadCrc,
		Acknowledge,
		NegativeAcknowledge,
		InvalidMessageClass
	}
}

