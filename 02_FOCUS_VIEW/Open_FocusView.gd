extends Node

@export var Loader : Node3D

func _ready():

	_global_datas._open_menu.connect(_open_menu)
	_global_datas.open_owl_view.connect(_open)
	_global_datas._open_focus_scene.connect(_open_focus_scene)
	
func _open(condition : bool):
	
	$"../All_root".visible = !condition	
	$"../Render".visible = !condition	
	
	_global_datas._show_object_legend.emit(false,"")

		
				
func _open_menu(condition : bool):

	if !condition:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)	
		
func _open_focus_scene(f_data : focus_data):

	for e in Loader.get_children():
		e.queue_free()

	var scene = f_data.focus_scene
	var instantiate = scene.instantiate()
	Loader.add_child(instantiate)	
	
	_global_datas.active_focus_view = f_data
