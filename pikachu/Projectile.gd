extends KinematicBody2D 

const THROW_VELOCITY = Vector2(800,0)

var velocity = Vector2.ZERO

func _ready():
	velocity = Vector2(100,0)
	#set_physics_process(false)

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta) 
	if collision != null:
		print("Collided!")
