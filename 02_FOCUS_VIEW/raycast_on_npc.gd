extends Node


@export var Render : TextureRect
@export var Camera : Camera3D

func _input(event: InputEvent) -> void:
	
	if !Render.visible:
		return	
	
	if event.is_action_pressed("Click"):
		_check_raycast()
		
		
func _check_raycast():

	var utility = GameUtility.new()
	var target_ui = $"../Viewport/target_ui".global_position
	#var mouse_position = get_viewport().get_mouse_position()
	var raycast = utility.get_raycast_target(target_ui,Camera,1,false,true)
	
	if raycast:
		#print(raycast)
		var hit_focus = raycast.collider.get_node_or_null("hit_focus")
		if hit_focus:
			#print("hit")
			_global_datas.transition_target = raycast.position
			hit_focus._set_focus()
		
		var hit_focus_npc = raycast.collider.get_node_or_null("npc_revealed")
		if hit_focus_npc:
			hit_focus_npc._npc_revealed()
		
		var Close_focus_view = raycast.collider.get_node_or_null("Close_focus_view")
		if Close_focus_view:
			_global_datas._open_focus_view.emit(false)
	
