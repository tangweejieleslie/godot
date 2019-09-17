extends Node2D

onready var fruit = preload("res://Item.tscn")
var score = 0

func add_item():
	var inst = fruit.instance()
	inst.position = Vector2(get_random_number(900,50), get_random_number(500,50))  ##The position should be random
	inst.connect("BodyEntered", self, "_on_Item_BodyEntered")
	add_child(inst)

# Called when the node enters the scene tree for the first time.
func _ready():
	add_item()
	pass # Replace with function body.

func get_random_number(MAX, MIN):
	randomize()
	var num = randi()%MAX + MIN
	return num

func _on_Item_BodyEntered():
	#print("Body entered signal received from GameMap")
	add_item()
	score += 1
	$Score/ScoreLabel.text = str(score) 
	pass # Replace with function body.
