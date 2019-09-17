extends KinematicBody2D

# const GRAVITY = 200.0
var WALK_SPEED = 450

var velocity = Vector2()

func _physics_process(delta):
    # velocity.y += delta * GRAVITY
	if Input.is_action_pressed("ui_left"):
		velocity.x = -WALK_SPEED
		velocity.y = 0
	elif Input.is_action_pressed("ui_right"):
		velocity.x =  WALK_SPEED
		velocity.y = 0
	elif Input.is_action_pressed("ui_down"):
		velocity.y =  WALK_SPEED
		velocity.x = 0
	elif Input.is_action_pressed("ui_up"):
		velocity.y =  -WALK_SPEED
		velocity.x = 0	
	else:
		velocity.x = 0
		velocity.y = 0

	if velocity.x != 0:
		$AnimatedSprite.animation = "right"
		$AnimatedSprite.flip_v = false
	    # See the note below about boolean assignment
		$AnimatedSprite.flip_h = velocity.x < 0
	elif velocity.y != 0:
		$AnimatedSprite.animation = "right"
		# $AnimatedSprite.flip_v = velocity.y > 0
	else:
		$AnimatedSprite.animation = "default"
		

	$AnimatedSprite.play()
    # We don't need to multiply velocity by delta because "move_and_slide" already takes delta time into account.
    # The second parameter of "move_and_slide" is the normal pointing up.
    # In the case of a 2D platformer, in Godot, upward is negative y, which translates to -1 as a normal.
	move_and_slide(velocity, Vector2(0, 0))