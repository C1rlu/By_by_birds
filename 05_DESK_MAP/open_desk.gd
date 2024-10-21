extends Node

@onready var render: TextureRect = $"../RENDER"

func _ready() -> void:
	pass
	#_global_datas._open_desk.connect(open_desk)
	
			
	#_global_datas._open_menu.connect(_close_menu)
	
	
	
func open_desk(condition):
	
	render.visible = condition

	if condition:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		
#func _close_menu(condition):
	#
	#if !condition:
		#Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
