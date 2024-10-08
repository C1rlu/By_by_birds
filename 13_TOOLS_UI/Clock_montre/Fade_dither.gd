extends Node


@export var texture_img : TextureRect
@export var fade_timing_in : float = 0.5
@export var fade_timing_out : float = 0.5
@onready var material : Material = texture_img.get_material()


var actual_value : float


func _ready():
	pass
	#material.set_shader_parameter("Opacity",0.0)
	

func fade_in():
	
	var t 
	if t:
		t.kill()
	t = create_tween()
	t .tween_method(_set_opacity_value,actual_value,1.0,fade_timing_in)
	
func fade_out():

	var t 
	if t:
		t.kill()
	t = create_tween()
	t.tween_method(_set_opacity_value,actual_value,0.0,fade_timing_out)
		
func _set_opacity_value( value : float):

	material.set_shader_parameter("Opacity",value)	
	actual_value = value
	
