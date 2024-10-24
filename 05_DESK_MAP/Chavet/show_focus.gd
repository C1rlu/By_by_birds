extends Node

@onready var root: Node3D = $"../.."


func _open_scene():

	var get_scene = root.scene_focus_data
	_global_datas._open_focus_scene.emit(get_scene)
	
