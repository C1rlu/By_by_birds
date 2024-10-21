extends Node


@export var Camera_head : Node3D
@export var Camera : Camera3D

@export var all_cam : Array[Camera3D]

func _ready() -> void:	

	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)	
		

	_global_datas.look_at_sensivity = 0.1
	
func _reset_cam():
	Camera.rotation_degrees = Vector3.ZERO

						
func _input(event: InputEvent) -> void:
	
		
	if !_global_datas.player_owl_moment:
		return
				
	if event is InputEventMouseMotion:
	
		Camera_head.rotate_y(deg_to_rad(-event.relative.x * _global_datas.look_at_sensivity))
		Camera.rotate_x(deg_to_rad(-event.relative.y * _global_datas.look_at_sensivity))
		
		Camera_head.rotation.y = clamp(Camera_head.rotation.y ,deg_to_rad(-60.0),deg_to_rad(60.0))
		Camera.rotation.x = clamp(Camera.rotation.x ,deg_to_rad(-60.0),deg_to_rad(60.0))
		
		_camera_folow()
		return 
		
	
func _camera_folow():
	
	for c in all_cam:
		c.rotation.y = Camera_head.rotation.y			
		c.rotation.x = Camera.rotation.x
