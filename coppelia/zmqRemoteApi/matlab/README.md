# zmqRemoteApi

Set of [Matlab](https://www.mathworks.com/) functions to manage the communication with the [CoppeliaSim](https://www.coppeliarobotics.com/) robotic simulator (as the simulator itself as several simulated robots and sensors) by using the [ZeroMQ remote API](https://www.coppeliarobotics.com/helpFiles/en/zmqRemoteApiOverview.htm).  It is one of the ways that CoppeliaSim provides to write external applications.

The computer has to to be connected to internet the first time that the Coppelia library is used because the [Zero MQ](https://www.zeromq.org/) library has to be downloaded.  Once the file is downloaded internet access is not required.

## How to use

The file ``client.m`` contains an example of use.  It implements a collision avoidance behavior (the thresholds should be fine-tuned for the correct robot operation, otherwise it can be stuck by the obstacles).  The script calls several functions to connect to the simulator, start and stop the simulation, read from the sensors, and move the robot motors.

In order to use the directory with the code provided by Coppelia has to be added to the search path.  It can be done in the Matlab configiration dialog or from the command window (or console):

```
>> addpath 'C:\Program Files\CoppeliaRobotics\CoppeliaSimEdu\programming\zmqRemoteApi\clients\matlab'
```

Note that Matlab does not save the path if the second method is used. Thus, the command has to be executed when Matlab is started.
