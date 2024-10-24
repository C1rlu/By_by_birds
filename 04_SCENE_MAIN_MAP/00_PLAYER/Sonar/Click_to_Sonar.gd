extends Area3D

var can_click = true
@onready var on_over_mouse_3d_shape = $"../Sonar/On_OverMouse_3D_SHAPE"


var lock_tools = false
func _ready():
	_global_datas.player_active_tools.connect(_unlock)
	
func _unlock(condition):
	lock_tools = condition	

func _input(event: InputEvent) -> void:
	
	if !lock_tools:
		return

	if !can_click:
		return


	if event.is_action_pressed("Click"):
	
		_global_datas._active_sonar.emit()
		

func _on_mouse_entered():
	
	return
	pass
	if !lock_tools:
		return

	
	can_click = true
	#_global_datas.Cursor_mode.cursor_in()
	_global_datas.Player_lock_click = true
	on_over_mouse_3d_shape.visible = true
	
func _on_mouse_exited():
	return
	pass
	can_click = false
	#_global_datas.Cursor_mode.cursor_out()
	_global_datas.Player_lock_click = false
	on_over_mouse_3d_shape.visible = false
