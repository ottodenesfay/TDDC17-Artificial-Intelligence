(define (problem SHAKEYS_WORLD_PROBLEM)
  (:domain SHAKEYS_WORLD_DOMAIN)

  (:objects
	s     			- SHAKEY
	g1 g2			- GRIPPER
	r1 r2 r3		- ROOM
	l1 l2 l3		- LIGHT_SWITCH
	d1 d2 d3		- DOOR
	b     			- BOX
	o1 o2			- OBJECT)

  (:init
	(in s r2) (in b r1) (in o1 r1) (in o2 r1) (in l1 r1) (in l2 r2) (in l3 r3)   ;declare where the objects, lightswitches and box are
	(connecting d1 r1 r2) (connecting d2 r2 r3) (connecting d3 r2 r3)            ;declare the doors
	(connecting d1 r2 r1) (connecting d2 r3 r2) (connecting d3 r3 r2)
	(adjacent r1 r2) (adjacent r2 r3) (adjacent r2 r1) (adjacent r3 r2)          ;declare what rooms are adjacent
	(wide d1) (wide d3)
	(free g1) (free g2)
	;(not (holding g1 o))
	(not (turned_on l2 r2)) (not (turned_on l1 r1)) (not (turned_on l3 r3))      ;declare that the lights are not turned on
	(not (at b l1)) (not (at b l2)) (not (at b l3)))                             ;declare where box is

  (:goal (and (in o1 r2) (in o2 r3) (turned_on l2 r2) (turned_on l1 r1) (turned_on l3 r3))) ;goal is that object 1 is in room 3, object 2 is in room 2, and all the lights turned on
)
