extends Node

@export var List_of_words : Array[Sprite3D]

var index : int = -1

var ls_state : int = 0 



func _ready() -> void:
	
	_global_datas._add_next_clues.connect(next_clues)
	_global_datas._reset_clues.connect(_reset)
	_global_datas._change_language_state.connect(reset_ls)
	_reset()
	
	
func _reset():
	index = -1	
	for w in List_of_words:
		w.visible = false	
		w._set_word("")
	
func next_clues():
	
	if index == 2:
		return 
	var selected_clue : clue_data = _global_datas.selected_clue_data
	index += 1 
	
	var extractor = dialogue_info_reader.new()
	var select_ls = extractor.extract_ls(selected_clue.Clues[index],ls_state)
	
	List_of_words[index]._set_word(select_ls)	
	List_of_words[index].visible = true	


	
func reset_ls(_ls_state : int):
	
	ls_state = _ls_state
	var selected_clue : clue_data = _global_datas.selected_clue_data	
	
	var extractor = dialogue_info_reader.new()
	
	for i in range(index+1):
		var select_ls = extractor.extract_ls(selected_clue.Clues[i],_ls_state)	
		List_of_words[i]._set_word(select_ls)
		
	
	
		
