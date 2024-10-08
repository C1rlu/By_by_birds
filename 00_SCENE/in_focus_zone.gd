extends Node


@export var focus_view_ui : Node3D

func _ready() -> void:
	
	_global_datas._in_focus_zone.connect(_open_focusZone)
	
	
func _open_focusZone(condition : bool, position : Vector3):
	
	focus_view_ui.visible = condition	
	
	if condition:
		focus_view_ui.position = position	


func _input(event):
	
	
	if _global_datas.Player_InDialogue:
		return

	if _global_datas.Player_InMenu:
		return	
		
	if _global_datas.player_in_desk:
		return
		
	if focus_view_ui.visible:
		if event.is_action_pressed("Click"):
			_global_datas._open_focus_view.emit(true)
			
