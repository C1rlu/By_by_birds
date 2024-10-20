extends Node3D


var _Bird_view_data : Bird_view_data
@export var bird_node : Node3D 


func _ready() -> void:
	_Bird_view_data = Bird_view_data.new()
	
	$Area3D/hit_focus.bird_data = _Bird_view_data
	_Bird_view_data.camera_view = $cam	
	_Bird_view_data.bird_col = $Area3D/col
	_Bird_view_data.bird_node = bird_node

	$Area3D.position = bird_node.position
