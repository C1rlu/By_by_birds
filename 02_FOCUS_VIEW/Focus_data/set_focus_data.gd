extends Node

@export var _first_camera : Camera3D


func _ready() -> void:
	_global_datas.set_instant_focus.emit(_first_camera)
	
