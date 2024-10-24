extends Node

@onready var circle_effect: ColorRect = $"../Circle_effect"

var t 

var current_value : float	
func _input(event: InputEvent) -> void:
	
	var disable = true
	if disable:
		return
	
	if event.is_action_released("Click"):
		take_photo(false)
	
	if _global_datas.in_bird_hover:
		return	
		
	if _global_datas.photo_pause:
		return	
	if _global_datas.player_owl_moment:
		return	
	if _global_datas.in_journal_mode:
		return
	
	if event.is_action_pressed("Click"):
		take_photo(true)


func take_photo(condition : bool):
	
	if condition:
		
		if t:
			t.kill()
		t = create_tween()
		
		t.tween_method(_value,0.0,1.0,0.5)
		t.connect("finished",done)
	else:
		if t:
			t.kill()		
	
		t = create_tween()
		
		t.tween_method(_value,current_value,0.0,0.25)
	
		
func done():
	#_global_datas._take_photo.emit()
	take_photo(false)

func _value(v : float):
	circle_effect.get_material().set_shader_parameter("Opacity",v)
	current_value = v			
