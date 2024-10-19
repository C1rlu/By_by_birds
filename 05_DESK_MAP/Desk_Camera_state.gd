extends Node



func _ready() -> void:
	reset_state()	


func reset_state():
	
	_global_datas.camera_state_index = 0	
	
func _input(event: InputEvent) -> void:
	
	if !_global_datas.player_on_desk:
		return
	
	if _global_datas.Player_InMenu:
		return
	
	if event.is_action_pressed("right_click"):
		
		if _global_datas.camera_state_index == 2:
			_global_datas.camera_state_index = 1
			_global_datas.open_book_board.emit(false)
			return
		if _global_datas.camera_state_index == 0:
			_global_datas.player_on_desk = false
			_global_datas._open_desk.emit(false)
			return
		if _global_datas.camera_state_index != 0:
			_global_datas.camera_state_index = 0	

			return
	
	if event.is_action_pressed("Click"):
		if _global_datas.camera_state_index == 2:
			return
		_global_datas.camera_state_index = 1
		
