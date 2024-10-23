extends Node

@export var debug_clue_data : clue_data

func _ready() -> void:
	$CLue_timer.timeout.connect(_open_owl_view)
	
	_global_datas.selected_clue_data = debug_clue_data
	
	
func _open_owl_view():
	_global_datas.player_owl_moment =!_global_datas.player_owl_moment 
	_global_datas.open_owl_view.emit(_global_datas.player_owl_moment)	
	
	_global_datas._add_next_clues.emit()
	
	
