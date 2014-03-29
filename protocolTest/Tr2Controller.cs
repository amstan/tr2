using System;
using System.IO.Ports;
using System.Threading;

namespace protocolTest
{
	public class Tr2Controller : IDisposable
	{
		public const int Baud = 115200;
		public const int NumberOfLeds = 4;
		public const int NumberOfMotors = 4;

		private const int checksumLength = 2;

		public Tr2State State {
			get {
				return state;
			}
		}

		private SerialPort serial;
		private Tr2State state;

		public Tr2Controller (string portName)
		{
			serial = new SerialPort () {
				PortName = portName,
				BaudRate = Baud,
				StopBits = StopBits.One,
				Handshake = Handshake.None,
				Parity = Parity.None,
				DataBits = 8
			};

			state = Tr2State.Closed;
		}

		public void Open()
		{
			if (state == Tr2State.Closed)
			{
				serial.Open ();
				state = Tr2State.Open;
			}
			else
			{
				throw new Exception ("Cannot open a disposed or opened object.");
			}
		}

		public void Close()
		{
			if (state == Tr2State.Open)
			{
				serial.Close ();
				state = Tr2State.Closed;
			}
			else
			{
				throw new Exception ("Cannot close a closed or disposed object.");
			}
		}

		public void Dispose()
		{
			if (state != Tr2State.Disposed)
			{
				serial.Dispose ();
				state = Tr2State.Disposed;
			}
			else
			{
				throw new Exception ("Cannot dispose a disposed object");
			}
		}

		public void ValidateLedNum(int ledNum)
		{
			if (ledNum < 0 || ledNum >= NumberOfLeds)
				throw new Exception (string.Format ("Led index {0} is out of range", ledNum));
		}

		public void EnableLed(int ledNum)
		{
			ValidateLedNum (ledNum);

			var command = new byte[5];
			command [0] = (byte)MessageClass.UserLed;
			command [1] = (byte)LedMessageType.Enable;
			command [2] = (byte)ledNum;

			appendChecksum (command);
			sendSimpleCommand (command);
		}

		public void DisableLed(int ledNum)
		{
			ValidateLedNum(ledNum);

			var command = new byte[5];
			command [0] = (byte)MessageClass.UserLed;
			command [1] = (byte)LedMessageType.Disable;
			command [2] = (byte)ledNum;

			appendChecksum (command);
			sendSimpleCommand (command);
		}

		public void ToggleLed(int ledNum)
		{
			ValidateLedNum (ledNum);

			var command = new byte[5];
			command [0] = (byte)MessageClass.UserLed;
			command [1] = (byte)LedMessageType.Toggle;
			command [2] = (byte)ledNum;

			appendChecksum (command);
			sendSimpleCommand (command);
		}

		public void ValidateMotorNum(int driverNum)
		{
			if (driverNum < 0 || driverNum >= NumberOfMotors)
				throw new Exception (string.Format("Motor index {0} is out of range."));
		}

		public void RawSpiMotorCommand(int driverNum, byte[] message)
		{
			ValidateMotorNum (driverNum);

			var command = new byte[6 + message.Length];

			command [0] = (byte)MessageClass.MotorDriver;
			command [1] = (byte)MotorDriverMessageType.RawSpi;
			command [2] = (byte)driverNum;
			command [3] = (byte)message.Length;
			Array.Copy (message, 0, command, 4, message.Length);

			appendChecksum (command);
			serial.Write (command, 0, command.Length);

			waitForBytes (command.Length);
			serial.Read (command, 0, command.Length);
			validateChecksum (command);

			// Put the response back into the message
			Array.Copy (command, 4, message, 0, message.Length);
		}

		private void validateChecksum(byte[] command)
		{
			var checksum = computeChecksum (command);
			var responseChecksum = (command [command.Length - 2] << 8) | command [command.Length - 1];

			if (checksum != responseChecksum)
				throw new Exception ("Invalid checksum from Tr2.");
		}

		private void appendChecksum(byte[] command)
		{
			var checksum = computeChecksum (command);

			command [command.Length - 2] = (byte)(checksum >> 8);
			command [command.Length - 1] = (byte)(checksum);
		}

		private int computeChecksum(byte[] command)
		{
			var checksum = 0;

			for (int i = 0; i < command.Length - checksumLength; i++)
			{
				checksum += command [i];
			}

			return checksum;
		}

		private void sendSimpleCommand(byte[] command)
		{
			serial.Write (command, 0, command.Length);

			waitForBytes (4);

			var response = new byte[4];
			serial.Read (response, 0, 4);

			if (response [0] != (byte)MessageClass.Protocol
			   || response [1] != (byte)ProtocolMessageType.Acknowledge)
				throw new Exception ("Tr2 failed to acknowledge command.");

			validateChecksum (response);
		}

		private void waitForBytes(int bytes)
		{
			while (serial.BytesToRead < bytes)
				Thread.Sleep (1);
		}			
	}
}

