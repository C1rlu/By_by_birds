extends Node


var words_element_button : Array[Label]

func _ready() -> void:
	_global_datas._open_proposition.connect(_set_proposition)
	
	var list = $"../Words/ScrollContainer/GridContainer".get_children()
			
	words_element_button.append_array(list)

	
func _set_proposition(condition : bool):
	
	if condition:

		var current_scene_list = _global_datas.active_focus_view.Npc_datas_list	
		
		for button in words_element_button:
			button.visible = false
			 
		var list_count = current_scene_list.size()	
		for i in range(0,list_count):
			words_element_button[i].visible = true	
			
			words_element_button[i]._set_word(current_scene_list[i].words)	
