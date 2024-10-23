extends Node


@export var Camera_head : Node3D
@export var Camera : Camera3D

var rotation_value_x : float = 0
func _ready() -> void:	

	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)	

	_global_datas.look_at_sensivity = 0.05
	
				
func _input(event: InputEvent) -> void:
	
	if _global_datas.player_owl_moment:
		return
	
	if _global_datas.photo_pause:
		return
	
	if _global_datas.in_journal_mode:
		return
		
	if event is InputEventMouseMotion:
	
		Camera_head.rotate_y(deg_to_rad(-event.relative.x * _global_datas.look_at_sensivity))
		
		var rotate_target = deg_to_rad(-event.relative.y * _global_datas.look_at_sensivity)
		rotation_value_x += rotate_target
		rotation_value_x = clamp(rotation_value_x,deg_to_rad(-90.0),deg_to_rad(90.0))
		
		Camera.rotation.x = rotation_value_x
	
	
		
		
		 
	
	
		
		
		
	
		
		
		
		
