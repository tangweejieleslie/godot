extends KinematicBody2D

var motion = Vector2() #holds x and y value
var speed = 250

func _process(delta):
	if Input.is_action_pressed("ui_right"):
		motion.x = speed
		motion.y = 0
	elif Input.is_action_pressed("ui_left"):
		motion.x = -speed
		motion.y = 0
	elif Input.is_action_pressed("ui_up"):
		motion.y = -speed	
		motion.x = 0
	elif Input.is_action_pressed("ui_down"):
		motion.y = speed		
		motion.x = 0				
	# else:
		#motion.x = 0
		#motion.y = 0
		

	move_and_slide(motion)		
	pass

