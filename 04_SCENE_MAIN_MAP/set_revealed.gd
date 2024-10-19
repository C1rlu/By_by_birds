extends Node

@export var element_to_revealed : Array[MeshInstance3D]
const MAIN_FOG_MAT = preload("res://00_SHADER/Main_fog_mat.tres")
var is_revealed : bool


func _ready() -> void:
	pass	
	#if element_to_revealed:
		#set_fog(element_to_revealed)
	

func set_fog(mesh_array: Array):
	
	for mesh in mesh_array:
		if mesh:
			var material_count = mesh.get_surface_override_material_count()

			for i in range(material_count):
				var new_next_pass = MAIN_FOG_MAT.duplicate()
				var material = mesh.get_surface_override_material(i)
				material.set_next_pass(new_next_pass)

func hide():
	change_fog(1.0)	
		
func show():
	
	change_fog(0.0)	
	#if is_revealed:
		#return
		#
	#is_revealed = true	
	#print("Show_me")
	#var fade_in
	#fade_in = create_tween()
	#fade_in.tween_method(change_fog,1.0,0.0,3.0)
	#
	
func change_fog(value : float):

	
	for mesh in element_to_revealed:
			var material_count = mesh.get_surface_override_material_count()

			for i in range(material_count):
				var material = mesh.get_surface_override_material(i)
				var next = material.get_next_pass()
				next.set_shader_parameter("Opacity",value)
