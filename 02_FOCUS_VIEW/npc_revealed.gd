extends Node


@onready var npc_mesh: MeshInstance3D = $"../.."
var material_pass : Material

var is_revealed : bool = false
func _ready() -> void:
	
	material_pass = npc_mesh.get_surface_override_material(0).get_next_pass()

	
func _npc_revealed():

	if _global_datas.current_focus_data:
		if _global_datas.current_focus_data.scene_resolved:
			return
	
	if !is_revealed:
		material_pass.set_shader_parameter("Opacity",1.0)
		_global_datas.check_focus_count.emit()
		is_revealed = true