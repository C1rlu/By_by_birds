extends Node


@export var focus_view_ui : Node3D
@export var frame : Node
func _ready() -> void:
	
	_global_datas._in_focus_zone.connect(_open_focusZone)
	
	
func _open_focusZone(condition : bool):
	
	focus_view_ui.visible = condition	

func _input(event):
	
	
	if _global_datas.Player_InMenu:
		return	
			
	if focus_view_ui.visible:
		if event.is_action_pressed("Click"):
			#_global_datas._open_focus_view.emit(true)
			frame._frame_focusView()
