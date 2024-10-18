extends Node


@export var rotation_root: Node3D 
@export var Cam: Camera3D
@export var Cam_light: Camera3D
@export var Cam_light_warm: Camera3D
@export var Cam_ui: Camera3D

@onready var timer: Timer = $Timer
var direction_speed : bool
var dir_value

var rotation_speed : float 

@export var disable = true
	
func _ready() -> void:
	
	if disable:
		return
		
	_global_datas._end_of_transition.connect(_reset)
	timer.timeout.connect(end_of_time)
	timer.start()
	

func _reset():
	
	rotation_root.rotation_degrees = Vector3.ZERO
	adapt_speed()	
	
	
func adapt_speed():
	
	var camera_distance = Cam.global_position.distance_to(Vector3.ZERO)
	

	rotation_speed = 0.8 / camera_distance * 10	
	
	
func _process(delta: float) -> void:
	
	Cam_light.global_position = Cam.global_position 
	Cam_light.global_rotation_degrees = Cam.global_rotation_degrees

	Cam_light_warm.global_position = Cam.global_position 
	Cam_light_warm.global_rotation_degrees = Cam.global_rotation_degrees
	
	Cam_ui.global_position = Cam.global_position 
	Cam_ui.global_rotation_degrees = Cam.global_rotation_degrees
	
	if disable:
		return
	
	if direction_speed:
		rotation_root.rotation_degrees.y -= rotation_speed * delta
	else:
		rotation_root.rotation_degrees.y += rotation_speed * delta

		
	

func end_of_time():
	direction_speed =! direction_speed	
	timer.start()			
