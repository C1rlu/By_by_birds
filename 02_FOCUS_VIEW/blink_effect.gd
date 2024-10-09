extends Node

@onready var render: TextureRect = $"../Render"

var fade_out
func _ready() -> void:
	_global_datas._end_of_transition.connect(_blink_out)
	_global_datas.set_new_focus.connect(_blink_in)
	


func _blink_in(camera):
	
	if fade_out:
		fade_out.kill()
	
	var fade
	fade = create_tween()
	fade.tween_method(_effect,0.0,1.0,0.5)
	
func _blink_out():
	
	print("started effect")
	if fade_out:
		fade_out.kill()
	
	fade_out = create_tween()
	fade_out.tween_method(_effect,1.0,0.0,3.0)
	fade_out.connect("finished",done)
	
func done():
	_global_datas._open_focus_view.emit(false)	

func _effect(value : float):
	render.get_material().set_shader_parameter("Opacity",value)	
	
