extends Node


@export var _debug_test : bool = false

func _ready() -> void:
	
	_global_datas.open_owl_view.connect(open)
	_global_datas.player_owl_moment = _debug_test
	_global_datas.open_owl_view.emit(_debug_test)	


func open(condition:bool):
	
	$"../Owl_scene".visible = condition
	$"../BACKDROP_FOCUS".visible = condition
	$"../RENDER".visible = condition
