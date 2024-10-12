extends Node

@export var target_node : Node3D
@export var Camera : Camera3D

@export var active_click : bool = false

@onready var timer = $Timer


func _input(event):
	
	
	if _global_datas.Player_InMenu:
		return

	if !active_click:
		return
	if event.is_action_pressed("Click"):
		
		if !timer.is_stopped():
			return
		timer.start()
		_global_datas._roll_bird.emit()
		_bird_call_only()
		
	

func _bird_call_only():
	var target = _global_datas.bird_raycast_ground_position
	_global_datas._active_sonar.emit(target)	

		
func _raycast():
	
	var mouse_position = get_viewport().get_mouse_position()
	var utility = GameUtility.new()
	var result = utility.get_raycast_target(mouse_position,Camera,1,false,true)
	
	
	target_node.position = result.position
	_global_datas._active_sonar.emit(target_node.position)
	_global_datas._follow_target.emit(target_node.position)
	
