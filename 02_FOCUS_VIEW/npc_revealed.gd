extends Node


@export var npc_mesh: MeshInstance3D 
@export var show_FocusScene_dialogue : Node

var material_pass : Material
var is_revealed : bool  

@onready var dialogue: Sprite3D = $"../../Dialogue"


func _ready() -> void:
	
	material_pass = npc_mesh.get_surface_override_material(0).get_next_pass()
	
func _hover_npc(condition : bool):
	
	if condition:	
		material_pass.set_shader_parameter("Opacity",1.0)	
	else:
		material_pass.set_shader_parameter("Opacity",0.0)	
		
func _npc_revealed():

		#material_pass.set_shader_parameter("Opacity",1.0)
		_global_datas._open_proposition.emit(true)
		_global_datas.selected_npc_dialogue = show_FocusScene_dialogue
		
