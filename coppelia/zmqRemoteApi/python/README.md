# zmqRemoteApi

A bunch of [Python3](https://www.python.org/) classes to manage the communication with the [CoppeliaSim](https://www.coppeliarobotics.com/) robotic simulator (as the simulator itself as several simulated robots and sensors).  The classes use the [ZeroMQ remote API](https://www.coppeliarobotics.com/helpFiles/en/zmqRemoteApiOverview.htm).  It is one of the ways that CoppeliaSim provides to write external applications.

For the rest of the documentation it is assumed that [ubuntu](https://ubuntu.com/) (or any debian-like linux) and the [bash](https://www.gnu.org/software/bash/) shell are used.  Follow equivalent steps if other software is used.

## Dependencies

Several open source libraries are used.  Unless specified otherwise all of them are available from the usual repositories.  The libraries must be installed separately. Please refer to their documentation for installation details. Here it is only offered a minimal support for quick installation.

* [Concise Binary Object Representation](https://bitbucket.org/bodhisnarkva/cbor) (CBOR) is comparable to JSON, has a superset of JSON’s ability, but serializes to a binary format which is smaller and faster to generate and parse.

* The [Zero MQ](https://www.zeromq.org/) (0MQ) lightweight messaging kernel is a library which extends the standard socket interfaces with features traditionally provided by specialised messaging middleware products. 0MQ sockets provide an abstraction of asynchronous message queues, multiple messaging patterns, message filtering (subscriptions), seamless access to multiple transport protocols and more.

Install the libraries by using the usual Python package management systems such as [pip](https://packaging.python.org/en/latest/tutorials/installing-packages/):

```
$ /path/to/python -m pip install pyzmq
$ /path/to/python -m pip install cbor
```

or from the own Linux distribution repository. Use the following commands in debian-like distributions:

```
$ sudo apt install python3-cbor
$ sudo apt install python3-zmq
```

## How to use

Firtly, add the Python modules provided by CoppeliaSim to the ``PYTHONPATH`` variable by running the ``config.bash`` script.  Remember to use ``source`` to force the execution in the current shell, otherwise the value of the variable will not be changed.  Feel free to modify the script accordingly to refer the correct directory or to add these modules to the path.

```
$ source config.bash
```

Start the CoppeliaSim simulator and load one of the scenes provided by this repository with a Pioneer P3DX robot or create a new scene that includes this robot.  (The label for the robot has to be ``PioneerP3DX``, otherwise the label for the robot should be modified in the external script.)

Read carefully the ``avoid.py`` file, which is a minimal sample of robot controller, and run the script from the command line by using (or equivalent):

```
$ python3 avoid.py
```

The controller implements a simple heuristic, rule-based controller.  Note that the thresholds should be fine-tuned for the correct robot operation, otherwise it can be stuck by the obstacles.
