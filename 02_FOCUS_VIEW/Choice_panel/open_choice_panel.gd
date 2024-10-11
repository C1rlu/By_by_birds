extends Node

@export var Panel_root : Control
@export var target_look : TextureRect
var panel_index : int

func _ready() -> void:
	_global_datas._open_choice_panel.connect(_open)
	_open(false)
	
func _open(condition : bool):
	Panel_root.visible = condition	
	_global_datas.Player_InMenu = condition
	target_look.visible = !condition
	if condition:
		
		
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)	
		add_index()
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)	
		panel_index = 0
	
	
func add_index():
	
	panel_index += 1	
	

func _input(event: InputEvent) -> void:
	
	
	if !Panel_root.visible:
		return
	
	if event.is_action_pressed("right_click"):
		_global_datas._open_choice_panel.emit(false)					
	
	
	
	
	
	
