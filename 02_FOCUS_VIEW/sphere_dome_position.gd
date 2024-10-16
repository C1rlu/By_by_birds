extends Node3D

@onready var head: Node3D = $"../../Viewport/head"

func _ready() -> void:
	_global_datas._end_of_transition.connect(_update_position)
	
	
	
func _update_position():
	
	var new_position = Vector3(head.position.x,0.0,head.position.z)
	position = new_position	
	
