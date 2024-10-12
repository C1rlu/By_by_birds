extends Node


@export var delevery_ui_node : Node3D

func _ready():
	_global_datas._in_desk_zone.connect(_in_delevery_zone)
	
	
	
func _in_delevery_zone(condition : bool):

	if condition:
		delevery_ui_node.visible = false
	else:
		delevery_ui_node.visible = false	
	
	delevery_ui_node.visible = condition

func _input(event):
	
	

	if _global_datas.Player_InMenu:
		return	
		
	if _global_datas.player_in_desk:
		return
	
	if _global_datas.Player_inFocusView:
		return
		
	if delevery_ui_node.visible:
		if event.is_action_pressed("Click"):
			_global_datas._open_desk.emit(true)
