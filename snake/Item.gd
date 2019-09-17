extends Area2D

signal BodyEntered

func _ready():
	pass # Replace with function body.

func _on_Item_body_entered(body):
	emit_signal("BodyEntered")
	print(body.name, " entered")
	if body.name == "Player":
		queue_free() # add a check for which body entered
	pass # Replace with function body.
