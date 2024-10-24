extends Node

@export var Camera : Camera3D
@export var Bird_select_effect : Node3D
var previous_onOver
var npc_onOver
func _input(event: InputEvent) -> void:
	
	if _global_datas.player_owl_moment:
		return
	if _global_datas.in_proposition_mode:
		return
		
	_on_over()

	if event.is_action_pressed("Click"):
		_check_raycast()
		
		
func _check_raycast():

	var utility = GameUtility.new()
	var target_ui = $"../Render/Target".global_position
	var raycast = utility.get_raycast_target(target_ui,Camera,1,true,false)
	
	if raycast:

		var hit_focus = raycast.collider.get_node_or_null("hit_focus")
		if hit_focus:
			_global_datas.transition_target = raycast.position
			hit_focus._set_focus()
			if previous_onOver:
				Bird_select_effect.visible = false
				previous_onOver = null

		var hit_focus_npc = raycast.collider.get_node_or_null("npc_revealed")
		if hit_focus_npc:
			hit_focus_npc._npc_revealed()
					
		var Moon = raycast.collider.get_node_or_null("Moon")
		if Moon:
			_global_datas.player_owl_moment = true
			_global_datas.open_owl_view.emit(true)	
			_global_datas._show_object_legend.emit(false,"null")
			
func _on_over():

	var utility = GameUtility.new()
	var target_ui = $"../Render/Target".global_position
	var raycast = utility.get_raycast_target(target_ui,Camera,1,true,false)
	
	
	if previous_onOver:
		Bird_select_effect.visible = false
		previous_onOver = null
		_global_datas.in_bird_hover = false
	
	if npc_onOver:
		npc_onOver._hover_npc(false)
		npc_onOver = null
		
	if !raycast:
		_global_datas.in_bird_hover = false
		return
	
	var hit_focus = raycast.collider.get_node_or_null("hit_focus")
	if hit_focus:
		Bird_select_effect.visible = true
		Bird_select_effect.global_position = hit_focus.get_position()
		previous_onOver = hit_focus
		_global_datas.in_bird_hover = true
		
	
	var hit_focus_npc = raycast.collider.get_node_or_null("npc_revealed")
	if hit_focus_npc:
		hit_focus_npc._hover_npc(true)
		npc_onOver = hit_focus_npc
