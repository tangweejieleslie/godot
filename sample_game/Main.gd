extends Node2D

export(PackedScene) var Item

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Player_body_entered(body):
	print("Add point +1")
	print(body)
	pass # Replace with function body.




func item_body_entered(body):
	print("Pikachu hit the ball")
	pass # Replace with function body.
