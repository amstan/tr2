using System;

namespace protocolTest
{
	public enum ProtocolCommand : byte
	{
		BadCrc,
		Acknowledge,
		NegativeAcknowledge,
		InvalidMessageClass
	}
}

