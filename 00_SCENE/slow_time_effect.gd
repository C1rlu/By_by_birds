extends Node





func _input(event: InputEvent) -> void:
	
	
	if event.is_action_released("right_click"):
		Engine.time_scale = 1.0	
	
	if event.is_action_pressed("right_click"):
		
		Engine.time_scale = 0.2

	
