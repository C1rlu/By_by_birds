extends Node


@export var dialogue_start : Array[String]

var dialogue_index : int = -1
var can_start : bool = false

func _next_dialogue_state():	
	
	if dialogue_index == dialogue_start.size()-1:
		_global_datas._reset_clues.emit()
		dialogue_index = -1
		can_start = true
		return
			
	dialogue_index += 1	
	var selected_text = dialogue_start[dialogue_index]
	_global_datas._show_object_legend.emit(true,selected_text)

	if  dialogue_index > 4:
		_global_datas._add_next_clues.emit()
		
		
