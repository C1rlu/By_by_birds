extends Node



func _ready() -> void:
	_global_datas._open_desk.connect(reset_state)


func reset_state(condition : bool):
	
	_global_datas.camera_state_index = 0	
	
func _input(event: InputEvent) -> void:
	
	
	if event.is_action_pressed("Back_call"):
		
		if _global_datas.camera_state_index == 0:
			_global_datas._open_desk.emit(false)
			return
		if _global_datas.camera_state_index != 0:
			_global_datas.camera_state_index = 0	
			return
	
	if event.is_action_pressed("Click"):
		print("Should open")
		_global_datas.camera_state_index = 1		
		return
