extends Node


@export var Render : TextureRect
@export var Camera : Camera3D

func _input(event: InputEvent) -> void:
	
	if !Render.visible:
		return	
	
	if event.is_action_pressed("Click"):
		_check_raycast()
			
func _check_raycast():
	
	if _global_datas.camera_state_index == 0:
		return

	Camera.current = true
	var utility = GameUtility.new()
	var mouse_position = get_viewport().get_mouse_position()
	#var target_position = $"../Target".position
	var raycast = utility.get_raycast_target(mouse_position,Camera,2,true,false)
	
	if raycast:
		$"../SubViewport/Raycast".global_position = raycast.position

		var Book = raycast.collider.get_node_or_null("Book")
		if Book:
			_global_datas.focus_on_board_book.emit(true)
			_global_datas.open_book_board.emit(true)

		var Turn_page_left = raycast.collider.get_node_or_null("Turn_page_left")
		if Turn_page_left:
			_global_datas.turn_left.emit()	
			
		var Turn_page_right = raycast.collider.get_node_or_null("Turn_page_right")
		if Turn_page_right:
			_global_datas.turn_right.emit()	
				
		var Show_focus = raycast.collider.get_node_or_null("Show_focus")
		
		if Show_focus:
			_global_datas._open_desk.emit(false)
			_global_datas.current_focus_data = Show_focus.get_focus_data()
			_global_datas._open_focus_view.emit(true)
