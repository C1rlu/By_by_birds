extends Node

const MAIN_FOG_MAT : Material = preload("res://00_SHADER/Main_fog_mat.tres")

@export var mesh_to_fog : Array[MeshInstance3D]
@onready var root: Node3D = $".."

var fog_pass_list : Array[Material]

var have_a_pass : bool = false
#func _ready() -> void:
#
	#_set_gof_pass()
	
	
	
func _set_gof_pass():
	
	for msh in mesh_to_fog:
	
		var sub_count = msh.get_surface_override_material_count()
		for n in range(0,sub_count):
			var fog_pass = MAIN_FOG_MAT.duplicate()
			msh.get_surface_override_material(n).set_next_pass(fog_pass)
			fog_pass_list.append(fog_pass)
	
	have_a_pass = true			
	set_fog_distance()	
	
	
#func _process(delta: float) -> void:
	#
	#if !have_a_pass:
		#return
	#
	#if _global_datas.moving_transition:
		#set_fog_distance()	
		#
func set_fog_distance():
	var distance = root.global_position.distance_to(Vector3.ZERO)
	#var distance = get_distance_factor(root.global_position,Vector3.ZERO,200.0)
	#print(distance)
	
	if distance > 100.0	:
		for m in fog_pass_list:
			m.set_shader_parameter("Opacity",0.99)	
		
				
func get_distance_factor(root_position: Vector3, player_position: Vector3, max_distance: float) -> float:
	var distance = root_position.distance_to(player_position)
	var clamped_distance = clamp(distance, 0, max_distance)
	return lerp(0.0, 1.0, clamped_distance / max_distance)
