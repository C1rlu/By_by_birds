extends Node


@export var Camera_head : Node3D
@export var Camera : Camera3D


func _ready() -> void:	

	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)	

	_global_datas.look_at_sensivity = 0.05	

				
func _input(event: InputEvent) -> void:
	
	if _global_datas.player_owl_moment:
		return
	
	if _global_datas.photo_pause:
		return
	
	if _global_datas.in_proposition_mode:
		return
		
	if event is InputEventMouseMotion:
	
		Camera_head.rotate_y(deg_to_rad(-event.relative.x * _global_datas.look_at_sensivity))
		
		var rotate_target = deg_to_rad(-event.relative.y * _global_datas.look_at_sensivity)
		Camera.rotation.x += rotate_target
		Camera.rotation.x = clamp(Camera.rotation.x,deg_to_rad(-90.0),deg_to_rad(90.0))
	
	
		
		
		 
	
	
		
		
		
	
		
		
		
		
