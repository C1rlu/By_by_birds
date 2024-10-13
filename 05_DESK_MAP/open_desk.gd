extends Node


func _ready() -> void:
	
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)		
	_global_datas._open_menu.connect(_close_menu)
	
	

func _close_menu(condition):
	
	if !condition:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
