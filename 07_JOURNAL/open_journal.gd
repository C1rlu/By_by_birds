extends Node

@onready var words: Control = $"../Words"


func _ready() -> void:
	_global_datas._open_journal.connect(_open_journal)
	
	_open_journal(false)
	
func _open_journal(condition : bool):
	
	words.visible = condition
	_global_datas.in_journal_mode = condition

	if condition:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)				
