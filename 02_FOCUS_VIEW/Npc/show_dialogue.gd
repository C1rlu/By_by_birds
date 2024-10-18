extends Node

@onready var dialogue: Sprite3D = $"../Dialogue"
@onready var label: Label = $"../SubViewport/Label"

var t

func _ready() -> void:
	
	_global_datas.hide_all_FocusScene_dialogue.connect(_hide_dialogue)
	label.visible_ratio = 0.0
	
func _show_dialogue():
	
	
	label.visible_ratio = 0.0
	dialogue.visible = true
	
	if t:
		t.kill()
	t = create_tween()
	
	t.tween_method(text_ratio,0.0,1.0,1.0)
	
	var utility = GameUtility.new()
	var timer_n = utility.create_timer(6.0,_hide_dialogue,self)
	timer_n.start()
	
func _hide_dialogue():
	
	dialogue.visible = false
	

func text_ratio(value : float):
	label.visible_ratio = value
