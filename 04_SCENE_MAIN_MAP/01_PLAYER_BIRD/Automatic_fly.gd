extends Node

@export var Player_rg : RigidBody3D

@onready var timer = $Timer
var selected_dir : Vector3

func _ready():
	Player_rg.player_flying.connect(_player_is_flying)
	timer.timeout.connect(_random_dir)
	
func _player_is_flying(condition : bool):
	
	
	if condition:
		timer.stop()
		
	else:
		
		if !timer.is_stopped():
			return
			
		#print("player is flying", condition)	
		timer.start()	

#func _process(delta):
	#
	#if !timer.is_stopped():
			#
		#Player_rg.apply_central_force(selected_dir * 1)	
	#
func _random_dir():
	
	
	#print("New random dir")

	var random_index = randi_range(0,3)

	var direction_forward = Player_rg.position + Vector3.FORWARD
	var direction_back = Player_rg.position + Vector3.BACK
	var direction_left = Player_rg.position + Vector3.LEFT
	var direction_right = Player_rg.position + Vector3.RIGHT
	
	if random_index == 0:
		selected_dir = direction_forward
	if random_index == 1:
		selected_dir = direction_back
	if random_index == 2:
		selected_dir = direction_left
	if random_index == 3:
		selected_dir = direction_right
		
				
