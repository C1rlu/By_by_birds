extends Node


@export var npc_mesh: MeshInstance3D 
@export var show_FocusScene_dialogue : Node

var material_pass : Material
var is_revealed : bool  

@onready var dialogue: Sprite3D = $"../../Dialogue"


func _ready() -> void:
	
	material_pass = npc_mesh.get_surface_override_material(0).get_next_pass()
	
	
func _npc_revealed():

	if !is_revealed:
		#material_pass.set_shader_parameter("Opacity",1.0)
		#_global_datas.check_focus_count.emit()
		is_revealed = true
		
	#_global_datas.hide_all_FocusScene_dialogue.emit()
	#show_FocusScene_dialogue._show_dialogue()
	
	_global_datas._take_photo.emit()
