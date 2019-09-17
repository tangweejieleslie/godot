extends Area2D

export var speed = 400

func _process(delta):
	$AnimatedSprite.play()
	var velocity = Vector2(speed,0)
	
	position += velocity * delta
