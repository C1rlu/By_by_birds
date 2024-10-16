extends Node

@onready var root : Node3D = $"../.."

@export var _focus_camera : Camera3D


func _set_focus():
	_global_datas.set_new_focus.emit(_focus_camera)
	
	if _global_datas.previous_bird == root:
		return	
	
	if _global_datas.previous_bird:
		_global_datas.previous_bird.visible = true

	_global_datas.previous_bird = root

	
