extends Node

@export var Render : TextureRect
@export var Backdrop : ColorRect
@export var Loader : Node3D

func _ready():

	_global_datas._open_focus_view.connect(_open)
	_open(false)
	
func _open(condition : bool):
	
	_global_datas.Player_InMenu = condition
	#if condition:
		#pass
		#clear_and_instantiate(board_element)
	
	Render.visible = condition
	Backdrop.visible = condition	
	_global_datas.Player_InMenu = condition
	
	var utility = GameUtility.new()
	var n_timer = utility.create_timer(0.01,_hide_info,self)
	n_timer.start()
	
func _hide_info():
	_global_datas._show_object_legend.emit(false,"null")		
	
func clear_and_instantiate(board_element : PackedScene):
	
	var all_child = Loader.get_children()
	
	for e in all_child:
		e.queue_free()
	
	if board_element:

		var instantiate = board_element.instantiate()
		instantiate.position = board_element.focus_start_position
		instantiate.rotation_degrees = board_element.focus_start_rotation_degrees
		instantiate.scale = Vector3(board_element.focus_start_scale,board_element.focus_start_scale,board_element.focus_start_scale)
		Loader.add_child(instantiate)
	
