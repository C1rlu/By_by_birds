extends Node

@onready var game_scene: Node = $"."

const JOURNAL_SCENE = preload("res://07_JOURNAL/JOURNAL_SCENE.tscn")

func _ready() -> void:


	_global_datas._add_journal.connect(_add_journal)
	

func _add_journal(condition: bool):
	
	if condition:
		_clear_scene()
		var instance_scene = JOURNAL_SCENE.instantiate() 			
		game_scene.add_child(instance_scene)

	
func _clear_scene():
	
	var child_scene = game_scene.get_children()	
	for c in child_scene:
		c.queue_free()
