extends Node


@export var Render : TextureRect
@export var Camera : Camera3D

func _input(event: InputEvent) -> void:
	
	if !Render.visible:
		return	
	
	if event.is_action_pressed("Click"):
		_check_raycast()
	
		
func _check_raycast():
	
	if !_global_datas.camera_state_index == 1:
		return
	
	Camera.current = true
	var utility = GameUtility.new()
	var mouse_position = get_viewport().get_mouse_position()
	var raycast = utility.get_raycast_target(mouse_position,Camera,2)
	
	if raycast:
		$"../SubViewport/Raycast".global_position = raycast.position

		var Book = raycast.collider.get_node_or_null("Book")
		if Book:
			_global_datas.focus_on_board_book.emit(true)
			#_global_datas.open_book.emit(true)	
			_global_datas.open_book_board.emit(true)
		
