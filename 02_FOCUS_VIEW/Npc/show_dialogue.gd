extends Node

@onready var dialogue: Sprite3D = $"../Dialogue"
@onready var timer: Timer = $Timer

func _ready() -> void:
	
	_global_datas.hide_all_FocusScene_dialogue.connect(_hide_dialogue)
	timer.timeout.connect(_hide_dialogue)
	
func _show_dialogue():
	
	dialogue.visible = true
	timer.start()
	
func _hide_dialogue():
	
	dialogue.visible = false
	
