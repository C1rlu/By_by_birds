extends Button

@onready var root : Control = $".."


func _ready() -> void:
	
	pressed.connect(_press)
	
	
func _press():
	
	_global_datas.open_owl_view.emit(true)
	_global_datas.player_owl_moment = true
	_global_datas._open_proposition.emit(false)
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)	
	root.queue_free()
