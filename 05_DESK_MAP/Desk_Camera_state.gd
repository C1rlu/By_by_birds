extends Node



func _ready() -> void:
	_global_datas._open_desk.connect(reset_state)


func reset_state(condition : bool):
	
	_global_datas.camera_state_index = 0	
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Click"):
		_global_datas.camera_state_index = 1		
