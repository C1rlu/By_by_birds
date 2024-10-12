extends Node


@export var rotation_root: Node3D 

@export var Cam: Camera3D
@export var Cam_light: Camera3D
@export var Cam_light_warm: Camera3D


@onready var timer: Timer = $Timer
var direction_speed : bool


func _ready() -> void:
	_global_datas._open_focus_view.connect(_reset)
	_global_datas._update_cam_focus.connect(_reset)
	timer.timeout.connect(end_of_time)
	
func _reset(value):
	
	rotation_root.rotation_degrees = Vector3.ZERO

	if value:	
		timer.start()	
	else:	
		timer.stop()	
		
func _process(delta: float) -> void:
	
	if direction_speed:
		rotation_root.rotation_degrees.y -= 1.0 * delta	
	else:
		rotation_root.rotation_degrees.y += 1.0 * delta

		
	Cam_light.global_position = Cam.global_position 
	Cam_light.global_rotation_degrees = Cam.global_rotation_degrees
	Cam_light.fov = Cam.fov
	
	Cam_light_warm.global_position = Cam.global_position 
	Cam_light_warm.global_rotation_degrees = Cam.global_rotation_degrees
	Cam_light_warm.fov = Cam.fov


func end_of_time():
	direction_speed =! direction_speed	
	timer.start()			
