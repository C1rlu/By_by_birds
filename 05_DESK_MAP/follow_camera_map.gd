extends Node


@export var camera_3d_follow : Camera3D 
@export var cam_target: Node3D 
@export var Camera3D_Main_Desk : Camera3D
@export var camera_3d_main_Map: Camera3D 
@export var camera_3d_main_Book: Camera3D 
var offset
var offset_rotation
var target_rotation



func _ready() -> void:
	
	
	offset = camera_3d_main_Map.global_position - cam_target.global_position
	target_rotation = camera_3d_main_Map.rotation_degrees
	
func _process(delta: float) -> void:
	

	if _global_datas.camera_state_index == 0:
		camera_3d_follow.global_position  = lerp(camera_3d_follow.global_position, Camera3D_Main_Desk.global_position , 3.0 * delta)	
		camera_3d_follow.rotation_degrees = lerp(camera_3d_follow.rotation_degrees, Camera3D_Main_Desk.rotation_degrees, 3.0 * delta)

	if _global_datas.camera_state_index == 1:
		rotation_angle(delta)
		camera_3d_follow.global_position  = lerp(camera_3d_follow.global_position, cam_target.global_position + offset , 3.0 * delta)	
		camera_3d_follow.rotation_degrees = lerp(camera_3d_follow.rotation_degrees, target_rotation + cam_target.rotation_degrees, 3.0 * delta)
	
	if _global_datas.camera_state_index == 2:
		camera_3d_follow.global_position  = lerp(camera_3d_follow.global_position, camera_3d_main_Book.global_position , 3.0 * delta)	
		camera_3d_follow.rotation_degrees = lerp(camera_3d_follow.rotation_degrees, camera_3d_main_Book.rotation_degrees, 3.0 * delta)
			
func rotation_angle(delta):

	#x
	var angle_target = cam_target.global_position.x
	var angle_target_clamp = clampf(angle_target,-0.5,0.5)
	var t = (angle_target_clamp - -0.5) / ( 0.5 -- 0.5)
	var target_angle = lerp(-20, 20, t)


	var rotation_target = Vector3(0.0, -target_angle,0.0)
	
	cam_target.rotation_degrees = rotation_target
	
	#for offset correction here
	var target_offset_x = lerp(-0.125,0.125, t)
	var target_offset_y = lerp(-0.05,0.05, t)
	offset_rotation = Vector3(-target_offset_x, target_offset_y,0.0)
