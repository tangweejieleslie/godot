extends Node2D

var score = 0
const MIN = 30
const MAX_WIDTH = 600-MIN
const MAX_HEGHT = 1024-MIN
const MAXSPEED = 750

# export (PackedScene) var Projectile
# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Item_body_entered(body):
	print(body, " hit pokeball")
	score +=1
	update_score(score)
	increase_speed(score)
	print($KinematicBody2D.WALK_SPEED)
	$Item.position = Vector2(random_number_generator(MIN,MAX_HEGHT),random_number_generator(MIN,MAX_WIDTH))
	#print($Item.position)
	pass # Replace with function body.
	
func random_number_generator(MIN, MAX):
	randomize()
	var num = randi()%MAX + MIN
	return num

func update_score(score):
	$Control/ScoreLabel.text = str(score)

func increase_speed(score):
	var current_speed = $KinematicBody2D.WALK_SPEED
	if current_speed < MAXSPEED:
		$KinematicBody2D.WALK_SPEED = current_speed * (100+score)/100 

func _on_KinematicBody2D_attack():
	print("Received Attack Signal")
	var projectile = load("res://Projectile.tscn").instance()
	add_child(projectile)
	pass # Replace with function body.
