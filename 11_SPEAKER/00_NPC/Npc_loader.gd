extends Node

@export var loader_node : Node3D




func _ready():
	
	_global_datas._open_dialogue.connect(update_npc)


func update_npc():

	_clear()

	var instance = _global_datas.Npc_Dialogue.prefabs.instantiate()
	loader_node.add_child(instance)

func _clear():
	for child in loader_node.get_children():
		loader_node.remove_child(child)	