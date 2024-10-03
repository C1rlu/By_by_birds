extends Node

@export var Map_node : Control


func _ready():
	#_global_datas._open_player_map.connect(_open_map)
	
	Map_node.visible = false
	

	

func _open_map(condition : bool):
	Map_node.visible = condition	
	_global_datas.Player_InMenu = condition
	
	if condition:
		_global_datas._add_back_call.emit(back_call)

func back_call():
	_global_datas._open_player_map.emit(false)
