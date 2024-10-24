extends Node

@onready var dialogue: Sprite3D = $"../Dialogue"
@onready var label: Label = $"../SubViewport/Label"

var t

func _ready() -> void:
	
	#_global_datas.hide_all_FocusScene_dialogue.connect(_hide_dialogue)
	_global_datas.show_all_dialogue.connect(_show_dialogue)
	label.visible_ratio = 0.0
	label.text = "?"
	
func _show_dialogue(condition : bool):

	dialogue.visible = condition


func _set_dialogue(text : String):
	
	label.visible_ratio = 0.0
	label.text = text
	dialogue.visible = true
	
	if t:
		t.kill()
	t = create_tween()
	
	t.tween_method(text_ratio,0.0,1.0,1.0)	
	
		
func _hide_dialogue():
	
	dialogue.visible = false
	

func text_ratio(value : float):
	label.visible_ratio = value
