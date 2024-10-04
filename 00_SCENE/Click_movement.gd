extends Node

@export var target_node : Node3D
@export var Camera : Camera3D

func _ready():
	pass


func _input(event):
	
	if event.is_action_pressed("Click"):
		print("click")
		_raycast()
		
		
func _raycast():
	
	var mouse_position = get_viewport().get_mouse_position()
	var utility = GameUtility.new()
	var result = utility.get_raycast_target(mouse_position,Camera)
	
	
	target_node.position = result.position
	_global_datas._active_sonar.emit(target_node.position)
	_global_datas._follow_target.emit(target_node.position)
	
