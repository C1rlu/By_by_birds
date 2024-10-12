extends Node

@export var smooth_speed = 3.0
var offset: Vector3
var active_target : Vector3

@export var _manuel_offset : Vector3
@export var _all_cam_array : Array[Camera3D]

func _ready():
	
	if _global_datas.camera_offset:
		var playerPosition = _global_datas.player_position
		offset = _global_datas.camera_offset
		for cam in _all_cam_array:
			cam.transform.origin = playerPosition + offset
				
	if !_global_datas.camera_offset:
		var playerPosition = _global_datas.player_position
		offset = _all_cam_array[0].transform.origin - playerPosition + _manuel_offset 
		_global_datas.camera_offset = offset 
		
func _physics_process(_delta):
	
	
	var playerPosition = _global_datas.player_position
	for cam in _all_cam_array:
		cam.transform.origin = lerp(cam.transform.origin, playerPosition + offset, smooth_speed * _delta)	
	
