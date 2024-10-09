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


	if condition:
		clear_and_instantiate()
		
func clear_and_instantiate():
	
	var all_child = Loader.get_children()
	
	for e in all_child:
		e.queue_free()
	
	if _global_datas.current_focus_data.focus_scene:
		var instantiate = _global_datas.current_focus_data.focus_scene.instantiate()
		Loader.add_child(instantiate)
	
	else: print("Pls set a focus data scene")
