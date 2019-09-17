extends Node2D

var score = 0
const MIN = 150
const MAX_WIDTH = 600-MIN
const MAX_HEGHT = 1024-MIN
const MAXSPEED = 750

func _ready():
	#Pokeball = load("res://Pokeball.tscn").instance()
	#Pokeball.position = Vector2(random_number_generator(MIN,MAX_HEGHT),random_number_generator(MIN,MAX_WIDTH))
	#add_child(Pokeball)
	pass

func _on_Pokeball_area_entered(area):
	handle_pokeball_contact(area)
	area.free() # Free electro-ball

func _on_Pokeball_body_entered(body):
	handle_pokeball_contact(body)

func handle_pokeball_contact(contactWith):
	print(contactWith," hit pokeball")
	score +=1
	update_score(score)
	increase_speed(score)
	print($Pokeball)
	$Pokeball.position = Vector2(random_number_generator(MIN,MAX_HEGHT),random_number_generator(MIN,MAX_WIDTH))

	
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
	var new_projectile = load("res://Area2D_projectile.tscn").instance()
	#print(new_projectile)
	new_projectile.position = $KinematicBody2D.position
	if Input.is_action_pressed("ui_left"):
		new_projectile.speed = -new_projectile.speed 
	add_child(new_projectile)
	
func _on_Walls_area_entered(area):
	print(area.name, "has entered")
	if area.name != "Pokeball":
		area.free() # This prevents clogging up with infinite instance of electro ball


