
extends Node

@export var Camera :Camera3D
@export var Cam_ : Array[Camera3D]

var t

var zoomed : bool = false

	
@export var enable : bool = false

func _input(event):
	
	
	if !enable:
		return	
	
	if !_global_datas.player_owl_moment:
		return
	
	if Input.is_action_pressed("right_click"):
		_zoom_in()
	if Input.is_action_just_released("right_click"):
		_zoom_out()


func _zoom_in():	
	
	var target = 30.0
	if t:
		t.kill()
	t = create_tween()
	t.tween_method(_fov,Camera.fov,target,0.25)

	_global_datas.look_at_sensivity = 0.05
	
func _zoom_out():	
	
	var target = 70.0
	if t:
		t.kill()
	t = create_tween()
	t.tween_method(_fov,Camera.fov,target,0.25)
	_global_datas.look_at_sensivity = 0.1

func _fov(value : float):
	Camera.fov = value	
	
	for c in Cam_:
		c.fov = value
