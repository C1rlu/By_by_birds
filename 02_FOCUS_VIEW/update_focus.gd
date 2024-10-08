extends Node


@export var Camera_root : Camera3D

var previous_cam : Camera3D

func _ready() -> void:
	
	_global_datas.set_new_focus.connect(set_instant_focus)
	_global_datas.set_instant_focus.connect(set_instant_focus)


func set_instant_focus(n_camera : Camera3D):
	
	Camera_root.global_position = n_camera.global_position
	Camera_root.global_rotation_degrees = n_camera.global_rotation_degrees	
	

func _set_new_focus(n_Camera : Camera3D):


	if previous_cam == n_Camera:
		return
	previous_cam = n_Camera
	
	
	var move_cam 
	move_cam = create_tween()
	move_cam.tween_property(Camera_root,"global_position",n_Camera.global_position,0.5).set_ease(Tween.EASE_OUT)

	var rotate_cam 
	rotate_cam = create_tween()
	rotate_cam.tween_property(Camera_root,"global_rotation_degrees",n_Camera.global_rotation_degrees,0.5).set_ease(Tween.EASE_IN)
	
