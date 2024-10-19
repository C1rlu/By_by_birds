extends Node


@export var delevery_ui_node : Node3D
@export var frame : Node

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
	
		
	if delevery_ui_node.visible:
		if event.is_action_pressed("Click"):
			pass
