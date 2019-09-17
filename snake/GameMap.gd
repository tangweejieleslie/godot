extends Node2D

onready var fruit = preload("res://Item.tscn")
onready var obstacle = preload("res://Obstacle_Item.tscn")

var score = 0
var fruitCount = 0
var obstacleCount = 0
var obstacleArray = []

func add_item(maxCount):
	for i in range(fruitCount, maxCount):
		var inst = fruit.instance()
		inst.position = Vector2(get_random_number(900,50), get_random_number(500,50))  ##The position should be random
		inst.connect("BodyEntered", self, "_on_Item_BodyEntered")
		add_child(inst)
		fruitCount += 1

func add_obstacle():
	var inst = obstacle.instance()
	inst.position = Vector2(get_random_number(900,50), get_random_number(500,50))  ##The position should be random
	inst.connect("ObstacleEntered", self, "_on_Obstacle_BodyEntered")
	obstacleArray.append(inst)
	add_child(inst)
	obstacleCount += 1		
	

# Called when the node enters the scene tree for the first time.
func _ready():
	add_item(1)
	print("Fruit count: ", fruitCount)
	pass # Replace with function body.

func get_random_number(MAX, MIN):
	randomize()
	var num = randi()%MAX + MIN
	return num

func _on_Item_BodyEntered():
	#print("Body entered signal received from GameMap")
	fruitCount -= 1
	if score >= 82:
		if fruitCount == 0:
			add_item(4)		
		if obstacleCount < 8:
			add_obstacle()			
	elif score >= 35:
		if fruitCount == 0:
			add_item(4)		
		if obstacleCount < 5:
			add_obstacle()
	elif score >= 10:
		if fruitCount == 0:
			add_item(2)		
		if obstacleCount < 3:
			add_obstacle()
	else:
		if fruitCount == 0:
			add_item(1)
		if obstacleCount < 1:
			add_obstacle()
	
	for i in obstacleArray:
		i.position = Vector2(get_random_number(900,50), get_random_number(500,50))
	
	print(fruitCount)
	score += 1
	$Score/ScoreLabel.text = str(score) 
	pass # Replace with function body.


func _on_Obstacle_BodyEntered():
	obstacleCount -= 1