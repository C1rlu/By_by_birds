extends Node

@onready var render: TextureRect = $"../RENDER"

func _ready() -> void:
	
	_global_datas._open_desk.connect(_open_desk)
	

func _open_desk(condition:bool):
	render.visible = condition	
	_global_datas.player_in_desk = condition


	#if condition:
		#Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	#else:
		#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
