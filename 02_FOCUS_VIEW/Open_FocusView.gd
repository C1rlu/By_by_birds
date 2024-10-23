extends Node

@export var Loader : Node3D
@export var list_of_scene : Array[focus_data]

func _ready():

	_global_datas._open_menu.connect(_open_menu)
	_global_datas.open_owl_view.connect(_open)
	
	
func _open(condition : bool):
	
	$"../All_root".visible = !condition	
	$"../Render".visible = !condition	
	
	_global_datas._show_object_legend.emit(false,"")
	
	if !condition:
		_open_scene()
		
				
func _open_menu(condition : bool):

	if !condition:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)	
		
func _open_scene():

	for e in Loader.get_children():
		e.queue_free()

	var scene_index = _global_datas.game_scene_state_index
	var scene = list_of_scene[scene_index].focus_scene
	var instantiate = scene.instantiate()
	Loader.add_child(instantiate)	
	
	
