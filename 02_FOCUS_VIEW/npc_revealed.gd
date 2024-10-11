extends Node


@onready var npc_mesh: MeshInstance3D = $"../.."
var material_pass : Material


func _ready() -> void:
	
	material_pass = npc_mesh.get_surface_override_material(0).get_next_pass()
	_global_datas._open_choice_panel.connect(_not_selected)
	
func _npc_revealed():

	_global_datas._open_choice_panel.emit(true)
	material_pass.set_shader_parameter("Opacity",1.0)
	
func _not_selected(condition):
	
	if !condition:
		material_pass.set_shader_parameter("Opacity",0.0)		
