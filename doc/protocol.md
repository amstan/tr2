# Board Protocol Definition

## Overview

This document describes the protocol used for communicating with the tr2 robot
controller board.

The tr2 robot controller board is intended merely as an IO extension of a host
platform such as a Linux Desktop PC or another embedded system.

## Message Format

    [Message Class]
    [Message Type]
    [Message Parameters]
    [CRC]

### Message Class

* Format  : Enum
* Length  : 8-bits
* Type    : MessageClass_t;
* Summary : The class of the message being sent. Example: User LED Command,
            Motor Command, Temperature Sensor Command

### Message Type

* Format  : Enum
* Length  : 8-bits
* Type    : MessageType_t (depends on the message class)
* Summary : The type of the message for this message classification. Example:
            Class: User LED Command, Type: Enable User LED

### Message Parameters

* Format  : Binary
* Length  : Variable
* Type    : uint8_t[]
* Summary : Each message class has a different set of parameters. Refer to the
            sections below for more information.

### Message Error Checking

* Format  : Binary
* Length  : 16-bits
* Type    : uint16_t
* Summary : Error checking is the last two bytes of every message. Error
            checking is a simple sum of all bytes in the message. Big-endian or
            network order is used here.

## Message Classifications

All messages communicating to and from the tr2 robot controller board have an
associated message class to aid in protocol implementation.

### User LED

* Value : 0

This classification interacts with the user LEDs on the board.

#### Message Types

##### Enable LED

* Value  : 0
* Sender : Host

This command enables one of the user LEDs.

###### Parameters

* LED Index
    * Value  : 0 - 3
    * Length : 8-bits

###### Response

Acknowledge user LED command.

##### Disable LED

* Value  : 1
* Sender : Host

This command disables one of the user LEDs.

###### Parameters

* LED Index
    * Value  : 0 - 3
    * Length : 8-bits

###### Response

Acknowledge user LED command.

##### Toggle LED

* Value  : 2
* Sender : Host

This command toggles one of the user LEDs.

###### Parameters

* LED Index
    * Value  : 0 - 3
    * Length : 8-bits

###### Response

Acknowledge user LED command.

##### Slave Acknowledge

* Value  : 3
* Sender : Slave

This command tells the host that the most recent LED command was successful.

###### Parameters

None

###### Response

None

##### Slave Negative Acknowledge

* Value:  : 4
* Sender  : Slave

This command tells the host that the most recent LED command was unsuccessful.

###### Parameters

None

###### Response

None

