extends Node2D

var score = 0
const MIN = 30
const MAX = 1000

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Item_body_entered(body):
	print("Something hit pokeball")
	score +=1
	update_score(score)
	increase_speed(score)
	print($KinematicBody2D.WALK_SPEED)
	$Item.position = Vector2(random_number_generator(MIN,1024),random_number_generator(MIN,600))
	print($Item.position)
	pass # Replace with function body.
	
func random_number_generator(MIN, MAX):
	randomize()
	var num = randi()%MAX + MIN
	return num

func update_score(score):
	$Control/ScoreLabel.text = str(score)

func increase_speed(score):
	var current_speed = $KinematicBody2D.WALK_SPEED
	if current_speed < 1000:
		$KinematicBody2D.WALK_SPEED = current_speed * (100+score)/100 