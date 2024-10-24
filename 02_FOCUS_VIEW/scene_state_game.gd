extends Node

@export var words : Node

func _ready() -> void:
	pass
	#_global_datas.open_owl_view.connect(_start)
#
	#$Timer.timeout.connect(_stop)

	
func _start(condition :bool):
	
	if condition:	
		$Timer.stop()
	else:
		_start_scene()		
func _start_scene():
	
	$Timer.start()
	print("TIMER START")
	words.current_words()

func _stop():

	_global_datas.open_owl_view.emit(false)
	_global_datas.player_owl_moment = false
	$Timer.stop()
