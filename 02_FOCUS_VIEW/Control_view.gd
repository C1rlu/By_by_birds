extends Node

@export var Camera :Camera3D
@export var Camera_light :Camera3D
@export var Camera_warm :Camera3D
@export var Camera_ui :Camera3D

@export var Render : TextureRect
var t

var zoomed : bool = false


func _ready():
	_global_datas._open_focus_view.connect(_reset)

	
func _in_condition(condition):
	
	if condition:
		_zoom_in()
	else:		
		_zoom_out()	
	
func _reset(condition):
	
	if condition:
		Camera.fov = 50.0
		
func _input(event):
	
	if Input.is_action_just_released("zoom"):
		_zoom_out()
	
	if _global_datas.photo_pause:
		return
		
	if _global_datas.player_owl_moment:
		return
		
	if _global_datas.in_proposition_mode:
		return
	
	if Input.is_action_pressed("zoom"):
		_zoom_in()
	
	


func _zoom_in():	
	
	var target = 20.0
	if t:
		t.kill()
	t = create_tween()
	t.tween_method(_fov,Camera.fov,target,0.25)

	_global_datas.look_at_sensivity = 0.05
	
func _zoom_out():	
	
	var target = 50.0
	if t:
		t.kill()
	t = create_tween()
	t.tween_method(_fov,Camera.fov,target,0.25)
	_global_datas.look_at_sensivity = 0.1

func _fov(value : float):
	Camera.fov = value	
	Camera_light.fov = value
	Camera_warm.fov = value	
	Camera_ui.fov = value
