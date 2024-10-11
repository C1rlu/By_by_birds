extends Node


@export var Camera_root : Camera3D
@export var Camera_head : Node3D

#@export var Blink_texture : ColorRect

var previous_cam : Camera3D

var blink
func _ready() -> void:
	
	_global_datas.set_new_focus.connect(_set_new_focus)
	_global_datas.set_instant_focus.connect(set_instant_focus)


func set_instant_focus(n_camera : Camera3D):
	
	if previous_cam == n_camera:
		return
	previous_cam = n_camera
	
	Camera_head.global_position = n_camera.global_position
	Camera_head.global_rotation_degrees = n_camera.global_rotation_degrees
	

	
	_global_datas._end_of_transition.emit()
	

				
	
func _set_new_focus(n_Camera : Camera3D):


	if previous_cam == n_Camera:
		return
	previous_cam = n_Camera
	
	# BLINK EFFECT
	#if blink:
		#blink.kill()
	#blink = create_tween()
	#blink.tween_method(_blink_effect,0.0,3.0,0.3).set_ease(Tween.EASE_OUT)
	#
	#CAM MOVE
	var move_cam 
	move_cam = create_tween()
	move_cam.tween_property(Camera_head,"global_position",_global_datas.transition_target,0.3).set_ease(Tween.EASE_OUT)
	move_cam.connect("finished",_done)

	
	
func _done():
	
	_global_datas._end_of_transition.emit()
	Camera_head.global_rotation_degrees = previous_cam.global_rotation_degrees	
	Camera_head.global_position = previous_cam.global_position
	#Blink_texture.get_material().set_shader_parameter("Blink",0.0)
	#
#func _blink_effect(value : float):
	#
	#Blink_texture.get_material().set_shader_parameter("Blink",value)
