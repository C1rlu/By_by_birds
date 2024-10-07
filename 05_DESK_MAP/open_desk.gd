extends Node

@onready var render: TextureRect = $"../RENDER"

func _ready() -> void:
	
	_global_datas._open_desk.connect(_open_desk)
	
	
	
func _open_desk(condition:bool):
	render.visible = condition	
	_global_datas.Player_InMenu = condition
