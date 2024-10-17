extends Node

@onready var render: TextureRect = $"../Render"
@onready var timer: Timer = $Timer

@onready var frame_blink_top: ColorRect = $"../Render/Frame_blink_top"
@onready var frame_blink_bot: ColorRect = $"../Render/Frame_blink_bot"


var fade_out
var frame_top
var frame_bot
var current_value : float

func _ready() -> void:
	
	_global_datas._frame_to_close.connect(directed_close)
	_global_datas._frame_to_journal.connect(directed_close_journal)
	

func _blink_out():
	if _global_datas.current_focus_data:
		if _global_datas.current_focus_data.scene_resolved:
			render.get_material().set_shader_parameter("Opacity",1.0)	
			return
	if frame_top:
		frame_top.kill()
		
	frame_top = create_tween()
	frame_top.tween_method(_frame_top,-720,-360,10.0)
	frame_top.connect("finished",done)	



func directed_close():
	
	if frame_top:
		frame_top.kill()
		
	frame_top = create_tween()
	if !current_value:
		current_value = 720	
	frame_top.tween_method(_frame_top,-current_value,-360,0.5)
	frame_top.connect("finished",done)
				
func directed_close_journal():
	
	if frame_top:
		frame_top.kill()
		
	frame_top = create_tween()
	if !current_value:
		current_value = 720	
	frame_top.tween_method(_frame_top,-current_value,-360,0.5)
	frame_top.connect("finished",done_mission)
		
func done():
	_global_datas._open_focus_view.emit(false)	
	
func done_mission():
	_global_datas._add_journal.emit(true)
	
func _effect(value : float):
	render.get_material().set_shader_parameter("Opacity",value)	
	
func _frame_top(value : float):
	frame_blink_top.position.y = value		
	frame_blink_bot.position.y = -value
	current_value = value
