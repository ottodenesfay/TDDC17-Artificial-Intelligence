(define (domain SHAKEYS_WORLD_DOMAIN)
  (:requirements 
  	  :adl
  	  :strips
	  :typing)

  (:types SHAKEY						;shakey himself
  	  GRIPPER						;a gripper which shakey has
  	  ROOM							;a room in which shakey can be
	  LIGHT_SWITCH 						;one light switch per room
	  DOOR 							;one or multiple normal doors connecting one room to another
	  BOX 							;a big object which shakey can push infront of him
	  OBJECT) 						;a small object which shakey can pick up. Can carry 2 at a time

  (:predicates
	  (adjacent	   	?r1 - ROOM ?r2 - ROOM)		;can move from room ?r1 to room ?r2
	  (connecting		?d - DOOR ?r1 ?r2 - ROOM)	;a door ?d can be walked through from room ?r
	  (in			?x ?y)				;?x is in ?y
	  (at			?x ?y)				;?x is at ?y
	  (on			?s - SHAKEY ?b - BOX)		;shakey ?s is on box ?b
	  
	  (turned_on	   	?l - LIGHT_SWITCH ?r - ROOM)		;lightswitch ?l is turned on
	  (wide			?d - DOOR)	       		;door ?d is wide
	  
	  (holding		?g - GRIPPER ?o - OBJECT)	;shakey ?s is holding an object ?o
	  (free			?g - GRIPPER))	  		;gripper ?g is free

  (:action ACTION_MOVE
  	  :parameters (?s - SHAKEY ?from ?to - ROOM ?d - DOOR)
	  
	  :precondition (and (adjacent ?from ?to)
	  		     (in ?s ?from)
			     (connecting ?d ?from ?to))

	  :effect (and (in ?s ?to) 
	  	  (not (in ?s ?from))))

(:action ACTION_GRIP
  	  :parameters (?o - OBJECT ?r - ROOM ?g1 - GRIPPER ?s - SHAKEY ?l - LIGHT_SWITCH)

	  :precondition (and (free ?g1)
			     (in ?s ?r)
			     (in ?o ?r)
			     (in ?l ?r)
			     (turned_on ?l ?r)
			     )

	  :effect (and (holding ?g1 ?o)
		       (not (free ?g1))))

  (:action ACTION_DROP
  	  :parameters (?o - OBJECT ?r - ROOM ?g - GRIPPER ?s - SHAKEY)
	  
	  :precondition (and (holding ?g ?o)
			    (in ?s ?r))

	  :effect (and (free ?g)		 
	  	       (in ?o ?r)
		       (not (holding ?g ?o))))

  (:action ACTION_PUSH_BOX_FROM_TO_ROOM
  	  :parameters (?s - SHAKEY ?b - BOX ?d - DOOR ?from - ROOM ?to - ROOM)

	  :precondition (and (adjacent ?from ?to)
	  		     (in ?s ?from)
			     (in ?b ?from)
			     (wide ?d)
			     (connecting ?d ?from ?to))

	  :effect (and (not (in ?s ?from))
	  	       (not (in ?b ?from))
	  	       (in ?s ?to)
		       (in ?b ?to)))

  (:action ACTION_PUSH_BOX_TO_LIGHT_SWITCH
  	   :parameters (?s - SHAKEY ?b - BOX ?r - ROOM ?l - LIGHT_SWITCH)
	   
	   :precondition (and (in ?s ?r)
	   		      (in ?b ?r)
			      (in ?l ?r))

	   :effect (and (at ?b ?l)))
			      
  (:action ACTION_LIGHT_SWITCH_ON
  	  :parameters (?r - ROOM ?s - SHAKEY ?b - BOX ?l - LIGHT_SWITCH)

	  :precondition (and (in ?l ?r)
	  		      (in ?s ?r)
			      (in ?b ?r)
			      (at ?b ?l)
			      (not (turned_on ?l ?r)))

	  :effect (and (turned_on ?l ?r)))

)