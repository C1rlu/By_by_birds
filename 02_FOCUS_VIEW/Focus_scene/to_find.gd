extends Node

@onready var birds_to_find: Node3D = $"../../.."


func _ready() -> void:
	
	if _global_datas.current_focus_data.scene_resolved:
		birds_to_find.queue_free()		
		
