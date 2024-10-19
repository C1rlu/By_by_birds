extends Node


@export var Camera_head : Node3D
@export var Camera : Camera3D



func _ready() -> void:	

	_global_datas._end_of_transition.connect(_reset_cam)
	_global_datas.look_at_sensivity = 0.1
	
func _reset_cam():
	Camera.rotation_degrees = Vector3.ZERO

						
func _input(event: InputEvent) -> void:
	
	if _global_datas.player_on_desk:
		return
	
	if _global_datas.photo_pause:
		return
	
			
	if event is InputEventMouseMotion:
	
		Camera_head.rotate_y(deg_to_rad(-event.relative.x * _global_datas.look_at_sensivity))
		Camera.rotate_x(deg_to_rad(-event.relative.y * _global_datas.look_at_sensivity))
		
		Camera.rotation.x = clamp(Camera.rotation.x ,deg_to_rad(-90.0),deg_to_rad(90.0))
		return 
		
	#if InputEventJoypadMotion:
		#var axis_vector = Vector2.ZERO
		#axis_vector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
		#axis_vector.y = Input.get_action_strength("move_backward") - Input.get_action_strength("move_forward")
		#Camera_head.rotate_y(deg_to_rad(-axis_vector.x * 10 * _global_datas.look_at_sensivity ))
		#Camera.rotate_x(deg_to_rad(-axis_vector.y * 10 *_global_datas.look_at_sensivity ))
		#
		#Camera.rotation.x = clamp(Camera.rotation.x ,deg_to_rad(-90.0),deg_to_rad(90.0))	

		
