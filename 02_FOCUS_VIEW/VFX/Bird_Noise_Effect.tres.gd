extends Node


@export var meshes : Array[MeshInstance3D]

#func _ready():
	#active_sonar()
	
func active_sonar():

	for m in meshes:
		m.visible = true
	
	var t 
	t = create_tween()
	
	t .tween_method(_change_scale,0.0,5.0,0.5).set_ease(Tween.EASE_OUT)
	t.connect("finished",_stop)

	var fade
	fade = create_tween()
	fade.tween_method(_opacity,1.0,0.0,0.5).set_ease(Tween.EASE_OUT)
	
	

func _change_scale(value : float):
	
	for msh in meshes:
		msh.scale = Vector3(value,value,value)
		
	
func _opacity(value : float):
	
	for msh in meshes:
		var mat = msh.get_surface_override_material(0)
		mat.set_shader_parameter("Opacity",value)			
		
func _stop():
	for m in meshes:
		m.visible = false


	
