extends Node


@export var flat_base : Array[MeshInstance3D]
const NO_LIGHT_SURFACE_MAT = preload("res://00_SHADER/No_light_surface_mat.tres")

func _add_pass():
	
	for f in flat_base:
		
		var 	light_pass_mesh : MeshInstance3D = f.diplicate()
		f.add_child(light_pass_mesh)	
		light_pass_mesh.position = f.position
		light_pass_mesh.set_surface_override_material(0,NO_LIGHT_SURFACE_MAT)			
		light_pass_mesh.set_layer_mask_value(1,false)	
		light_pass_mesh.set_layer_mask_value(2,true)
		
		
		var 	warm_pass_mesh : MeshInstance3D = f.diplicate()
		f.add_child(warm_pass_mesh)	
		warm_pass_mesh.position = f.position	
		warm_pass_mesh.set_surface_override_material(0,NO_LIGHT_SURFACE_MAT)
		warm_pass_mesh.set_layer_mask_value(1,false)	
		warm_pass_mesh.set_layer_mask_value(3,true)
