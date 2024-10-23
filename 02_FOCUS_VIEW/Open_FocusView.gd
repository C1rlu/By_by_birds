extends Node

@export var Loader : Node3D

func _ready():

	_global_datas._open_menu.connect(_open_menu)
	
	_global_datas.open_owl_view.connect(_open)
	_global_datas._open_scene.connect(_open_scene)
	
	
func _open(condition : bool):
	$"../All_root".visible = !condition	
	$"../Render".visible = !condition	
	
func _open_menu(condition : bool):

	if !condition:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)	
		
func _open_scene(scene : PackedScene):

	_global_datas.player_owl_moment = false
	_global_datas.open_owl_view.emit(false)

	for e in Loader.get_children():
		e.queue_free()

	var instantiate = scene.instantiate()
	Loader.add_child(instantiate)	
	
	
