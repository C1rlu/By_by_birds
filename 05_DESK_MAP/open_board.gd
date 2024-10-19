extends Node


	
func _input(event: InputEvent) -> void:
	
	
	if _global_datas.player_on_desk:
		return
		
		
	if event.is_action_pressed("Open_desk"):
		_global_datas.player_on_desk =! _global_datas.player_on_desk
		_global_datas._open_desk.emit(_global_datas.player_on_desk)
