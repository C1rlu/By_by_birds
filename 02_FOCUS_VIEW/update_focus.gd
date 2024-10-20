extends Node

@export var Camera_root : Camera3D
@export var Camera_head : Node3D

@export var Cam_to_follow : Array[Camera3D]

var previous_cam : Camera3D

func _ready() -> void:
	
	_global_datas.set_new_focus.connect(_set_new_focus)
	_global_datas.set_instant_focus.connect(set_instant_focus)


func set_instant_focus(n_camera : Camera3D):
	
	if previous_cam == n_camera:
		return
	previous_cam = n_camera
	
	Camera_head.global_position = n_camera.global_position
	Camera_head.global_rotation_degrees = n_camera.global_rotation_degrees
	Camera_root.global_rotation_degrees = n_camera.global_rotation_degrees

	_global_datas._end_of_transition.emit()
	

func _set_new_focus(n_Camera : Camera3D):

	if previous_cam == n_Camera:
		return
	previous_cam = n_Camera
	
	_global_datas.moving_transition = true
	_global_datas.hide_all_FocusScene_dialogue.emit()
	
	##CAM MOVE
	#var move_cam 
	#move_cam = create_tween()
	#move_cam.tween_property(Camera_head,"global_position",_global_datas.transition_target,0.3).set_ease(Tween.EASE_OUT)
	#move_cam.connect("finished",_done)

func _process(delta: float) -> void:
	
	if _global_datas.moving_transition:
			
		Camera_head.global_position = lerp(Camera_head.global_position,_global_datas.transition_target,5.0 * delta)
	
		for c in Cam_to_follow:
		
			c.global_position = Camera_root.global_position
			c.global_rotation_degrees = Camera_root.global_rotation_degrees
	
	
		var distance = Camera_head.global_position.distance_to(_global_datas.transition_target)
	
		if distance < 0.1:
			_done()	
	
	else:
		
		for c in Cam_to_follow:
		
			c.global_position = Camera_root.global_position
			c.global_rotation_degrees = Camera_root.global_rotation_degrees
							
func _done():
	
	_global_datas.moving_transition = false
	_global_datas._end_of_transition.emit()
	#Camera_head.global_position = previous_cam.global_position
	#
	#Camera_head.rotation.y = previous_cam.rotation.y	
	#Camera_root.rotation.x = previous_cam.rotation.x
	
