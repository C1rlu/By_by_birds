extends  Node

@onready var frame_blink_top: ColorRect = $"../Frame_blink_top"
@onready var frame_blink_bot: ColorRect = $"../Frame_blink_bot"

var frame_top
var frame_bot

func _frame_board():

	if frame_top:
		frame_top.kill()
		
	frame_top = create_tween()
	frame_top.tween_method(_frame_top,-720,-360,0.25)
	frame_top.connect("finished",done_board)
		
func _frame_focusView():


	if frame_top:
		frame_top.kill()
		
	frame_top = create_tween()
	frame_top.tween_method(_frame_top,-720,-360,0.25)
	frame_top.connect("finished",done_focus)	
	
func done_focus():
	_global_datas._open_focus_view.emit(true)	
	
func done_board():
	_global_datas._open_desk.emit(true)

func _frame_top(value : float):
	frame_blink_top.position.y = value		
	frame_blink_bot.position.y = -value
	
