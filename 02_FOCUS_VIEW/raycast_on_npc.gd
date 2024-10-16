extends Node

@export var Camera : Camera3D

func _input(event: InputEvent) -> void:
	
	if _global_datas.photo_pause:
		return
	
	if event.is_action_pressed("Click"):
		_check_raycast()
		
		
func _check_raycast():

	var utility = GameUtility.new()
	var target_ui = $"../Render/Target".global_position
	var raycast = utility.get_raycast_target(target_ui,Camera,1,false,true)
	
	if raycast:

		var hit_focus = raycast.collider.get_node_or_null("hit_focus")
		if hit_focus:
		
			_global_datas.transition_target = raycast.position
			
			hit_focus._set_focus()
		
		var hit_focus_npc = raycast.collider.get_node_or_null("npc_revealed")
		if hit_focus_npc:
			hit_focus_npc._npc_revealed()
		
		var Close_focus_view = raycast.collider.get_node_or_null("Close_focus_view")
		if Close_focus_view:
			_global_datas._frame_to_close.emit()
		
		var To_Find = raycast.collider.get_node_or_null("To_Find")
		if To_Find:
			_global_datas.current_focus_data.scene_resolved = true
			_global_datas._frame_to_journal.emit()
		
