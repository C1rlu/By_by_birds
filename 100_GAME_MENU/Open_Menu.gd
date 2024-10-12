extends Node


@onready var game_menu_root = $"../Game_Menu_Root"
@onready var focus_button = $"../Game_Menu_Root/MainMenu_Box/VBoxContainer/Resum_Button2"


func _ready():
	_global_datas._open_menu.connect(_open_menu)
	_open_menu(false)
	
	
func _open_menu(condition : bool):
	game_menu_root.visible = condition		
	
	if condition:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		
func _input(event):
	

	
	if event.is_action_pressed("Open_Menu"):
		_global_datas.Player_InMenu = true
		_global_datas._open_menu.emit(_global_datas.Player_InMenu)	
		focus_button.grab_focus()

		get_tree().paused = true
			
