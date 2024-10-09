extends Node

var disable_show : bool = false


func _ready():

	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

	
func _disable_show(_condition : bool):
	disable_show = _condition	
	

func _hide():
	pass
	#Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
func _show():
	if !disable_show:
		pass
		#Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
func condition(_condition : bool):
	
	
	if _condition:
		_show()
	else:	
		if !_global_datas.Player_InDialogue:	
			_hide()	
	
