extends Node


#@export var _button : Button

func _ready():
	pass
	#_button.pressed.connect(_ship_to)
	
	
func _ship_to():
	_global_datas.sending_bird.emit()