extends  Node

@onready var frame_blink_top: ColorRect = $"../Frame_blink_top"
@onready var frame_blink_bot: ColorRect = $"../Frame_blink_bot"

var frame_top


func _frame():

	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	if frame_top:
		frame_top.kill()
		
	frame_top = create_tween()
	frame_top.tween_method(_frame_top,-720,-360,0.25)
	frame_top.connect("finished",done)
		
func done():

	_global_datas._open_desk.emit(false)
func _frame_top(value : float):
	frame_blink_top.position.y = value		
	frame_blink_bot.position.y = -value
