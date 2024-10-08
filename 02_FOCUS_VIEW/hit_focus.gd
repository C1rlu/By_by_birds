extends Node


@export var _focus_camera : Camera3D

func _set_focus():
	_global_datas.set_new_focus.emit(_focus_camera)
