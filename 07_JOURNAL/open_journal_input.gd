extends Node

var open_journal : bool

func _input(event: InputEvent) -> void:
	
	pass
	#if _global_datas.player_owl_moment:
		#return
		#
	#if event.is_action_pressed("Open_journal"):
		#open_journal =! open_journal
		#_global_datas._open_journal.emit(open_journal)		
		#
