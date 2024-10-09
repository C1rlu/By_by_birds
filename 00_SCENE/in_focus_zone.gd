extends Node


@export var focus_view_ui : Node3D

func _ready() -> void:
	
	_global_datas._in_focus_zone.connect(_open_focusZone)
	
	
func _open_focusZone(condition : bool):
	
	focus_view_ui.visible = condition	



func _input(event):
	
	
	if _global_datas.Player_InDialogue:
		return

	if _global_datas.Player_InMenu:
		return	
		
	if _global_datas.player_in_desk:
		return
		
	if focus_view_ui.visible:
		if event.is_action_pressed("Click"):
			if !_global_datas.current_focus_data.scene_resolved:
				_global_datas._open_focus_view.emit(true)
			
