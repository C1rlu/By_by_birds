extends Node

@onready var dialogue: Sprite3D = $"../Dialogue"
@onready var timer: Timer = $Timer
@onready var label: Label = $"../SubViewport/Label"

var t


func _ready() -> void:
	
	_global_datas.hide_all_FocusScene_dialogue.connect(_hide_dialogue)
	timer.timeout.connect(_hide_dialogue)
	label.visible_ratio = 0.0
func _show_dialogue():
	
	
	label.visible_ratio = 0.0
	dialogue.visible = true
	
	if t:
		t.kill()
	t = create_tween()
	
	t.tween_method(text_ratio,0.0,1.0,1.0)
	
	timer.start()
	
func _hide_dialogue():
	
	dialogue.visible = false
	

func text_ratio(value : float):
	label.visible_ratio = value
