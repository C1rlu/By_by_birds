extends Node


func _ready() -> void:
	
	_global_datas.open_owl_view.connect(open)
	_global_datas.player_owl_moment = true
	_global_datas.open_owl_view.emit(true)	

func open(condition:bool):
	
	$"../Owl_scene".visible = condition
	$"../BACKDROP_FOCUS".visible = condition
	$"../RENDER".visible = condition
