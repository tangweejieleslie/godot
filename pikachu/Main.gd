extends Node2D

var score = 0
const MIN = 30
const MAX_WIDTH = 600-MIN
const MAX_HEGHT = 1024-MIN
const MAXSPEED = 750


func _ready():
	pass # Replace with function body.

func handle_pokeball_contact(contactWith):
	print(contactWith," hit pokeball")
	score +=1
	update_score(score)
	increase_speed(score)
	print($KinematicBody2D.WALK_SPEED)
	$Item.position = Vector2(random_number_generator(MIN,MAX_HEGHT),random_number_generator(MIN,MAX_WIDTH))
	#print($Item.position)

func _on_Item_area_entered(area):
	handle_pokeball_contact(area)
	pass # Replace with function body.

func _on_Item_body_entered(body):
	handle_pokeball_contact(body)
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
	var new_projectile = load("res://Area2D_projectile.tscn").instance()
	print(new_projectile)
	new_projectile.position = $KinematicBody2D.position
	add_child(new_projectile)
	
	pass # Replace with function body.

func _on_Walls_area_entered(area):
	print(area)
	print(area, "has entered")
	area.free() # This prevents clogging up with infinite instance of electro ball
	pass # Replace with function body.
