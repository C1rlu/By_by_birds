extends Node

@export var Camera_root : Camera3D
@export var Camera_head : Node3D

@export var Cam_to_follow : Array[Camera3D]

var previous_view : Node3D

func _ready() -> void:
	
	_global_datas.set_new_focus.connect(_set_new_focus)
	_global_datas.set_instant_focus.connect(set_instant_focus)


func set_instant_focus(cam : Camera3D):
	
	Camera_head.global_position = cam.global_position
	
	Camera_head.rotation.y = cam.rotation.y
	Camera_root.rotation.x = cam.rotation.x
	
	_global_datas._end_of_transition.emit()
	

func _set_new_focus(node_view : Node3D):

	if previous_view == node_view:
		return
	previous_view = node_view
	
	_global_datas.moving_transition = true
	_global_datas.hide_all_FocusScene_dialogue.emit()
	


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

	
