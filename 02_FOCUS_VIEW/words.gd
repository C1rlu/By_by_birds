extends Node

@export var focus_view : Node

var list_of_scene : Array[focus_data] 
var word_state : int = 0


func _ready() -> void:
	
	list_of_scene.append_array(focus_view.list_of_scene)
	$Timer.timeout.connect(show)
	
	
	_global_datas._next_scene_words_state.connect(next_words)
	
	
	
func current_words():
	$Timer.start()
	
	
func show():
	
	var scene_index = _global_datas.game_scene_state_index
	var focus_data_scene = list_of_scene[scene_index]
	var _current_words  = focus_data_scene.scene_clues[word_state]
	
	_global_datas._show_object_legend.emit(true,_current_words)

func next_words():
	
	word_state += 1
	current_words()
	
