extends Node


@export var words_element_button : Array[Button]

func _ready() -> void:
	_global_datas._open_journal.connect(_set_journal)
	
	
	
func _set_journal(condition : bool):
	
	if condition:

		var current_scene_list = _global_datas.active_focus_view.Npc_datas_list	
		
		for button in words_element_button:
			button.visible = false
			
		var list_count = current_scene_list.size()	
		for i in range(0,list_count):
			words_element_button[i].visible = true	
			
			words_element_button[i]._set_word(current_scene_list[i].words)
		

	
	
