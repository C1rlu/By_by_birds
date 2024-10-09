extends Node


var current_result_count : int 


func _ready() -> void:
	
	_global_datas.check_focus_count.connect(_check_focus_count)
	
	_global_datas._open_focus_view.connect(_reset_scene_count)
	
func _reset_scene_count(condition):
	
	current_result_count = 0	
	
func _check_focus_count():
	
	current_result_count += 1
	var scene_count = _global_datas.current_focus_data.scene_npc_count
	print("CURRENT SCENE COUNT  ", current_result_count)
	if scene_count == current_result_count:
		_global_datas._open_focus_view.emit(false)
		print("DONE WELL DONE")
		_global_datas.current_focus_data.scene_resolved = true
