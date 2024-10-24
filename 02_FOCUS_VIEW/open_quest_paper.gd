extends Node



var open_paper_journal : bool = false

func _input(event: InputEvent) -> void:
	
	
	var disable = true
	if disable:
		return
		
	if _global_datas.player_owl_moment:
		return
	
	if event.is_action_pressed("Open_journal"):
		
		open_paper_journal =! open_paper_journal
		_global_datas._open_journal.emit(open_paper_journal)					
