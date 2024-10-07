extends Node

@export var Render : TextureRect
@export var Backdrop : ColorRect
@export var Loader : Node3D

func _ready():

	_global_datas._open_focus_view.connect(_open)
	_open(false)
	
func _open(condition : bool):
	
	_global_datas.Player_InMenu = condition
	Render.visible = condition
	Backdrop.visible = condition	
	_global_datas.Player_InMenu = condition

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
	
