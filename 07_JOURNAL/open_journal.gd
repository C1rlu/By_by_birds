extends Node

@onready var journal_scene: Control = $"../JournalScene"
@onready var fade: ColorRect = $"../Fade"


func _ready() -> void:
	_global_datas._open_journal.connect(_open_journal)
	
	_open_journal(false)
	
func _open_journal(condition : bool):
	
	_global_datas.in_journal_mode = condition
	journal_scene.visible = condition
	fade	.visible = condition

	if condition:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)				
