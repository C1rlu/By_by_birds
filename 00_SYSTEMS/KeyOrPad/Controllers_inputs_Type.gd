extends Node


var using_pad : bool = false



func _input(event):
	
	if event is InputEventJoypadButton or event is InputEventJoypadMotion:
	
		_global_datas.using_pad.emit(true)
		_global_datas.player_using_pad = true
	else:
		_global_datas.player_using_pad = false
		_global_datas.using_pad.emit(false)

		
