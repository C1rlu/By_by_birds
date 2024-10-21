extends Node


@export var _debug_test : bool = false

func _ready() -> void:
	
	_global_datas.open_owl_view.connect(open)
	_global_datas.player_owl_moment = _debug_test
	_global_datas.open_owl_view.emit(_debug_test)	

func _input(event: InputEvent) -> void:
	
	if event.is_action_pressed("Open_desk"):
		
		_global_datas.player_owl_moment =!_global_datas.player_owl_moment 
		_global_datas.open_owl_view.emit(_global_datas.player_owl_moment)		

	
func open(condition:bool):
	
	$"../Board_scene".visible = condition
	$"../BACKDROP_FOCUS".visible = condition
	$"../RENDER".visible = condition
