extends Node


@onready var npc_mesh: MeshInstance3D = $"../.."
var material_pass : Material


func _ready() -> void:
	

	#var new_pass = NEXT_PASS_SELECT_EFFECT.duplicate() 
	#npc_mesh.get_surface_override_material(0).set_next_pass(new_pass)
	material_pass = npc_mesh.get_surface_override_material(0).get_next_pass()

	
func _npc_revealed():
	print("revealed")
	
	material_pass.set_shader_parameter("Opacity",1.0)
	
