extends Node



@export var Render : TextureRect

@export var rotation_root: Node3D 
@export var rotation_root_light: Node3D 
@export var rotation_root_light_warm: Node3D 

@export var Cam: Camera3D
@export var Cam_light: Camera3D
@export var Cam_light_warm: Camera3D


func _ready() -> void:
	_global_datas._open_focus_view.connect(_reset)
	
	
func _reset(condition : bool):
	
	if !Render.visible:
		return		
		
	rotation_root.rotation_degrees = Vector3.ZERO
	rotation_root_light.rotation_degrees = Vector3.ZERO
	rotation_root_light_warm.rotation_degrees = Vector3.ZERO
		
func _process(delta: float) -> void:
	
	if !Render.visible:
		return
		
	rotation_root.rotation_degrees.y -= 2.0 * delta
	rotation_root_light.rotation_degrees.y -= 2.0 * delta
	rotation_root_light_warm.rotation_degrees.y -= 2.0 * delta
	
	
	Cam_light.global_position = Cam.global_position 
	Cam_light.global_rotation_degrees = Cam.global_rotation_degrees
	Cam_light.fov = Cam.fov
	
	Cam_light_warm.global_position = Cam.global_position 
	Cam_light_warm.global_rotation_degrees = Cam.global_rotation_degrees
	Cam_light_warm.fov = Cam.fov
