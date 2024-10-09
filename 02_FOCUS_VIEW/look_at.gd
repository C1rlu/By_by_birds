extends Node


@export var Render : TextureRect

@export var Camera_head : Node3D
@export var Camera : Camera3D


var disable = true
var previous_camera : Camera3D
func _ready() -> void:	

	_global_datas._end_of_transition.connect(_reset_cam)
	_global_datas.look_at_sensivity = 0.1
	
func _reset_cam():
	Camera.rotation_degrees = Vector3.ZERO

						
func _input(event: InputEvent) -> void:
	
	#if disable:
		#return
	if !Render.visible:
		return
		
	if event is InputEventMouseMotion:
	
		Camera_head.rotate_y(deg_to_rad(-event.relative.x * _global_datas.look_at_sensivity))
		Camera.rotate_x(deg_to_rad(-event.relative.y * _global_datas.look_at_sensivity))
		
		Camera.rotation.x = clamp(Camera.rotation.x ,deg_to_rad(-60.0),deg_to_rad(90.0))
	
