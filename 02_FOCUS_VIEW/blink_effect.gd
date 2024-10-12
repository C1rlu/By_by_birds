extends Node

@onready var render: TextureRect = $"../Render"

var fade_out
func _ready() -> void:
	pass
	#_global_datas._end_of_transition.connect(_blink_out)

	
func _blink_out():
	
	if _global_datas.current_focus_data:
		if _global_datas.current_focus_data.scene_resolved:
			render.get_material().set_shader_parameter("Opacity",1.0)	
			return
	
	if fade_out:
		fade_out.kill()
	
	fade_out = create_tween()
	fade_out.tween_method(_effect,1.0,0.0,6.0)
	fade_out.connect("finished",done)
	
func done():
	_global_datas._open_focus_view.emit(false)	

func _effect(value : float):
	render.get_material().set_shader_parameter("Opacity",value)	
	
