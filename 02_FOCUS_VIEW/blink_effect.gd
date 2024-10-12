extends Node

@onready var render: TextureRect = $"../Render"
@onready var timer: Timer = $Timer

@onready var frame_blink_top: ColorRect = $"../Render/Frame_blink_top"
@onready var frame_blink_bot: ColorRect = $"../Render/Frame_blink_bot"


var fade_out

var frame_top
var frame_bot


func _ready() -> void:
	#_global_datas._end_of_transition.connect(_blink_out)
	timer.timeout.connect(_blink_out)
	timer.start()
func _blink_out():

	if _global_datas.current_focus_data:
		if _global_datas.current_focus_data.scene_resolved:
			render.get_material().set_shader_parameter("Opacity",1.0)	
			return
	#if fade_out:
		#fade_out.kill()
	#
	#fade_out = create_tween()
	#fade_out.tween_method(_effect,1.0,0.0,6.0)
	#fade_out.connect("finished",done)
	
	if frame_top:
		frame_top.kill()
		
	frame_top = create_tween()
	frame_top.tween_method(_frame_top,-720,-360,10.0)
	frame_top.connect("finished",done)	
	
func done():
	_global_datas._open_focus_view.emit(false)	

func _effect(value : float):
	render.get_material().set_shader_parameter("Opacity",value)	
	
func _frame_top(value : float):
	frame_blink_top.position.y = value		
	frame_blink_bot.position.y = -value
	
