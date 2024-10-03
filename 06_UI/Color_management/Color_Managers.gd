extends Node

var t
var current_value : float = 0.5

@export var active_dither_at_start : bool = false 
func _ready():
	#_NormalColor_mainScene()

	#ACTIVE DITHER
	RenderingServer.global_shader_parameter_set("active_Dither", active_dither_at_start )

	
func _NormalColor_mainScene():
	

	if t:
		t.kill()
	t = create_tween()
	

	t .tween_method(change_value,current_value,0.5,0.5).set_trans(Tween.TRANS_SINE)	
	
func change_value(value : float):
	RenderingServer.global_shader_parameter_set("isSubscene_value", value)
	current_value  = value
