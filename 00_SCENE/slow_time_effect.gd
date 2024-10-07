extends Node





func _input(event: InputEvent) -> void:
	
	
	if _global_datas.Player_InMenu:
		return
	
	if event.is_action_pressed("Back_call"):
		
		Engine.time_scale = 0.2

	if event.is_action_released("Back_call"):
		Engine.time_scale = 1.0	
