extends Area2D

signal ObstacleEntered

func _ready():
	pass # Replace with function body.

func _on_Obstacle_body_entered(body):
	emit_signal("ObstacleEntered")
	print(body.name, " entered")
	print("Minus health")
	if body.name == "Player":
		queue_free() # add a check for which body entered
	pass # Replace with function body.
