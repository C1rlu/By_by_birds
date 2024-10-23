extends Node



@export var _first_view : Camera3D
@export var _first_node: Node3D


func _ready() -> void:
	_global_datas.set_instant_focus.emit(_first_view)
	_first_node.visible = false
	
