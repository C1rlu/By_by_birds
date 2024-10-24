extends Node

func _ready() -> void:
	
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)	
	
	anim()
	
func anim():
	
	$"../Journnal_root".rotation_degrees = -1060.0
	$"../Journnal_root".scale = Vector2(0.05,0.0)
	var t
	t = create_tween()
	
	t.tween_property($"../Journnal_root","rotation_degrees",365.0,1.0).set_ease(Tween.EASE_OUT)

	
	var s
	s = create_tween()
	
	s.tween_method(scale,0.1,1.8,1.0).set_ease(Tween.EASE_OUT)
	s.connect("finished",_done)
	
func _done():
	print("DONE")
	$"../Journnal_root".scale = Vector2(2.0,2.0)				
		
func scale(value : float):
	$"../Journnal_root".scale = Vector2(value,value)		
	
