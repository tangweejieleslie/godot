extends KinematicBody2D

var speed = 500
var velocity = Vector2(0,0)

func _physics_process(delta):
	if Input.is_action_pressed("ui_down"):
		velocity.y = speed
		velocity.x = 0
	elif Input.is_action_pressed("ui_up"):
		velocity.y = -speed
		velocity.x = 0
	elif Input.is_action_pressed("ui_right"):
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed
		velocity.y = 0
	else:
		velocity = Vector2(0,0)
	
	move_and_slide(velocity)
	
	if velocity.x !=0:
		$AnimatedSprite.play("right")
		$AnimatedSprite.flip_h = velocity.x < 0
	elif velocity.y != 0:
	    $AnimatedSprite.animation = "right"
	else:
		$AnimatedSprite.play("default")
	
	