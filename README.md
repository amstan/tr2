# tr2

## Overview

The goal of this project is to develop a hardware and accompanying software
platform for controlling robots from a high level programming language such as
Python.

## Hardware

The hardware will consist of a multi-axis motor control board, industrial
strength GPIO for controlling alarms, incandescent lamps, driving fans and more.

## Software

The software will provide an abstract interface to the hardware platform. The
first robot that will be tailored to this project will be a 3-axis Delta Robot.

## Project Structure

Here is the folder structure for the project:

* blender/
    * 3D models of target robots
* board/
    * The first hardware platform for this project
* board/bomParser/
    * Some pretty untested code to do mass changes in schematics/BOMs
* datasheets/
    * Component datasheets
* doc/
    * Notes, logo
* firmware/
    * Bare metal bring up of STM32F4 and code for the robot controller
* pictures/
    * Various pictures of the project
* python/
    * The python software interfaces
* ui/
    * A user interface to all of this

