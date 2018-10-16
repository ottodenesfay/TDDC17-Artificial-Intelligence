# Artificial-Intelligence-Planning
Artificial intelligence TDDC17 HT 2018 lab 4 Shakeys World. Worked with ottodenesfay

Shakey's world, or versions thereof, is an AI classic. A robot, named Shakey, is moving around in a set of rooms, connected by doors. In some of the rooms there are light switches, so that the light in the room can be on or off. Spread throughout this world there are a number of big boxes and a number of smaller things (balls, blocks with letters on them, toy tractors and whatnot).
Here's an example of a rather small world layout:


	-------------------------------------------------------------------------
	|                       |                       |                       |
	|                       |                       |                       |
	|       light switch 1 -|- light switch2        |- light switch3        |
	|                       |                       |                       |
	|       ---             |                     door2                     |
	|       | |           door1      shakey         |                       |
	|       ---           (wide)                    |                       |
	|       box             |                       |                       |
	|                       |                     door3                     |
	|                       |                     (wide)                    |
	|        room1          |        room2          |         room3         |
	-------------------------------------------------------------------------
    
The following restrictions apply to Shakey's actions:

Shakey can carry small objects, but only two at a time because he has only two grippers.

For Shakey to be able to find a small object in a room, the light must be on in that room.

Shakey can not carry boxes, but can push them around. Boxes can only be pushed through wide doors, not narrow ones.

To switch the light in a room on or off Shakey must climb onto a box that is positioned below the switch (otherwise he can not reach the switch). This may in turn require moving the box into position, possibly from another room.

Typical problems for Shakey may be to find a specific object (e.g. the green block labeled "G") and bring it to a specific place, to turn the lights on/off in every room, or to remove all boxes and objects from one of the rooms (the last problem may require ADL, since the goal is a "for all").
