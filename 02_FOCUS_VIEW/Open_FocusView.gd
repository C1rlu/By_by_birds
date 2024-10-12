extends Node

@export var Render : TextureRect
@export var Backdrop : ColorRect
@export var Loader : Node3D
@export var Loader_light : Node3D
@export var Loader_light_warm : Node3D
func _ready():

	_global_datas._open_focus_view.connect(_open)
	_open(false)

func _open(condition : bool):
	
	_global_datas.Player_inFocusView = condition
	
	Render.visible = condition
	Backdrop.visible = condition
	
	if condition:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

	
	if condition:
		clear_and_instantiate()
		
func clear_and_instantiate():
	
	var all_child = Loader.get_children()
	var all_child_light = Loader_light.get_children()
	
	for e in all_child:
		e.queue_free()
		
	for e in all_child_light:
		e.queue_free()

	if _global_datas.current_focus_data.focus_scene:
		var instantiate = _global_datas.current_focus_data.focus_scene.instantiate()
		Loader.add_child(instantiate)		
		
		var instantiate_light = _global_datas.current_focus_data.focus_scene.instantiate()
		Loader_light.add_child(instantiate_light)
		
		var instantiate_light_warm = _global_datas.current_focus_data.focus_scene.instantiate()
		Loader_light_warm.add_child(instantiate_light_warm)
		
		
	else: print("Pls set a focus data scene")
