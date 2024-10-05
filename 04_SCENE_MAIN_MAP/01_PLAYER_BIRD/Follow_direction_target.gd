extends Node

@export var player_rg : RigidBody3D
@export var mouse_click : bool = false
var current_target : Vector3

func _ready():
	_global_datas._follow_target.connect(_follow_dir)
	
	
func _follow_dir(position : Vector3):
	
	
		
	print(position)	
	current_target = position
	
	
func _process(delta):
	
	if mouse_click:
		var direction = (player_rg.position - current_target).normalized()
		player_rg.apply_central_force(-direction * 5)
	

