extends Node

@export var Camera :Camera3D

@export var Render : TextureRect

func _ready():
	_global_datas._open_focus_view.connect(_reset)

func _reset(condition):
	
	if condition:
		Camera.fov = 50.0
		
func _input(event):
	
	
	if !Render.visible:
		return
	
	if Input.is_action_pressed("right_click"):
		_zoom_in()
	if Input.is_action_just_released("right_click"):
		_zoom_out()


func _zoom_in():	
	
	var target = 20.0
	var t
	t = create_tween()
	t.tween_property(Camera,"fov",target,0.1)

	_global_datas.look_at_sensivity = 0.05
	
func _zoom_out():	
	
	var target = 50.0
	var t
	t = create_tween()
	t.tween_property(Camera,"fov",target,0.1)
	_global_datas.look_at_sensivity = 0.1
