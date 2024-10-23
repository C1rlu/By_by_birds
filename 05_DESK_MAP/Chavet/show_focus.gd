extends Node

@onready var root: Node3D = $"../.."


func _open_scene():
	var get_scene = root._scene_focus_data.focus_scene
	_global_datas._open_scene.emit(get_scene)
	
