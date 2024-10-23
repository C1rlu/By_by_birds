extends Node

@export var Camera : Camera3D
@export var Dialogue_state : Node

func _input(event: InputEvent) -> void:
	
	if !_global_datas.player_owl_moment:
		return
		
	if event.is_action_pressed("Click"):
		_check_raycast()
			
func _check_raycast():
	
	
	Camera.current = true
	var utility = GameUtility.new()
	var mouse_position = get_viewport().get_mouse_position()
	#var target_position = $"../Target".position
	var raycast = utility.get_raycast_target(mouse_position,Camera,1,true,false)

	if raycast:
	
		var Bird_order = raycast.collider.get_node_or_null("Bird_order")
		if Bird_order:
			Dialogue_state._next_dialogue_state()	
	
		var Open_scene = raycast.collider.get_node_or_null("Open_level")
		
		if Open_scene:
			_global_datas.open_owl_view.emit(false)
			_global_datas.player_owl_moment = false
			
		var Moon = raycast.collider.get_node_or_null("Moon")

		if Moon:
			if Dialogue_state.can_start:
				_global_datas.player_owl_moment = false
				_global_datas.open_owl_view.emit(false)	
				_global_datas._show_object_legend.emit(false,"null")
