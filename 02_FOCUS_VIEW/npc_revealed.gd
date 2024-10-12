extends Node


@onready var npc_mesh: MeshInstance3D = $"../.."
var material_pass : Material


func _ready() -> void:
	
	material_pass = npc_mesh.get_surface_override_material(0).get_next_pass()

	
func _npc_revealed():


	material_pass.set_shader_parameter("Opacity",1.0)
	
