extends Node



func _ready() -> void:
	
	_global_datas.focus_on_board_book.connect(focus_book)
	
	
func focus_book(conditon):
	
	
	if conditon:
		_global_datas.camera_state_index = 2
	else:
		_global_datas.camera_state_index = 1		
