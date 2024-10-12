extends Node

@onready var root : Node3D = $"../.."

@export var _focus_camera : Camera3D

var to_remove : bool 
func _set_focus():
	_global_datas.set_new_focus.emit(_focus_camera)
	_global_datas._end_of_transition.connect(_check_remove)
	to_remove = true


func _check_remove():
	
	if to_remove:
		root.queue_free()
