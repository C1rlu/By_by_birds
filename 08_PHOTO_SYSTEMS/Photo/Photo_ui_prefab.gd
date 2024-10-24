extends Control

@export var Photo_Border : TextureRect

var return_photo : bool = false

func _set_photo(image_texture : Texture2D):
	Photo_Border.texture = image_texture
	
func _ready():	
	
	move()

	
func move():
	
	_global_datas.photo_pause = true
	
	
	var resolution : Vector2 = get_viewport_rect().size	
	var target_position = Vector2(resolution.x / 2.0, resolution.y/ 2)
	position = target_position
	
	var t

	t = create_tween()
	t.tween_property(self,"position",target_position,0.5).set_trans(Tween.TRANS_SINE)
	t.connect("finished",grab_button)
	

func grab_button():
	return_photo = true

func _input(event: InputEvent) -> void:
	
	if !return_photo:
		return 
	if event.is_action_pressed("Click"):
		out_movement()	
		
func out_movement():
	return_photo = false
	
	var resolution : Vector2 = get_viewport_rect().size
	var target_position = Vector2(resolution.x+100, resolution.y/ 2.0)
	var random_angle = randf_range(-6.0, -90.0)

	var t

	t = create_tween()
	t.tween_property(self,"position",target_position,0.25).set_trans(Tween.TRANS_SINE)
	t.connect("finished",done)
	
	var r	
	r = create_tween()
	r.tween_property(self,"rotation_degrees",random_angle,0.25).set_trans(Tween.TRANS_SINE)	
	
func done():
	_global_datas.photo_pause = false
	_global_datas._open_journal.emit(true)
	queue_free()
	
