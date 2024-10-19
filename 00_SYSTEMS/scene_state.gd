extends Node

@onready var game_scene: Node = $"."

const _02_MAIN_SCENES = preload("res://00_SCENE/02_main_scenes.tscn")
const _02_FOCUS_VIEW = preload("res://02_FOCUS_VIEW.tscn")
const _04_BOARD = preload("res://04_board.tscn")
const JOURNAL_SCENE = preload("res://07_JOURNAL/JOURNAL_SCENE.tscn")

func _ready() -> void:

	#_global_datas._open_focus_view.connect(_add_focus_scene)
	#_global_datas._open_desk.connect(_add_desk_scene)
	_global_datas._add_journal.connect(_add_journal)
	
	
	
func _add_focus_scene(condition: bool):
	
	if condition:
		_clear_scene()
		var instance_scene = _02_FOCUS_VIEW.instantiate() 			
		game_scene.add_child(instance_scene)
	else:
		_clear_scene()
		var instance_scene = _04_BOARD.instantiate() 			
		game_scene.add_child(instance_scene)
		
func _add_desk_scene(condition: bool):
	
	_global_datas.player_on_desk = condition
	
	if condition:
		_clear_scene()
		var instance_scene = _04_BOARD.instantiate() 			
		game_scene.add_child(instance_scene)
	else:
		_clear_scene()
		var instance_scene = _02_FOCUS_VIEW.instantiate() 			
		game_scene.add_child(instance_scene)

func _add_journal(condition: bool):
	
	if condition:
		_clear_scene()
		var instance_scene = JOURNAL_SCENE.instantiate() 			
		game_scene.add_child(instance_scene)
	else:
		_clear_scene()
		var instance_scene = _02_MAIN_SCENES.instantiate() 			
		game_scene.add_child(instance_scene)

	
func _clear_scene():
	
	var child_scene = game_scene.get_children()	
	for c in child_scene:
		c.queue_free()
