extends Node

@onready var words: Control = $"../Words"



func _ready() -> void:
	_global_datas._open_proposition.connect(open_proposition)
	
	open_proposition(false)
	
func open_proposition(condition : bool):
	
	words.visible = condition
	_global_datas.in_proposition_mode = condition

	if condition:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)				
