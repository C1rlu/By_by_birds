extends Node


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)	
	_global_datas._open_menu.connect(_open_menu)

	
func _open_menu(condition : bool):

	if !condition:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)	
