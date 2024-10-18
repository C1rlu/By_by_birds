extends Node

@export var scene_data : focus_data

func _load_destination():
	_global_datas.current_focus_data = scene_data
	_global_datas._open_focus_view.emit(true)	 
	
