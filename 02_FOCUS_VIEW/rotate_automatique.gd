extends Node


@export var rotation_root: Node3D 
@export var camera : Node3D 


@onready var timer: Timer = $Timer
var direction_speed : bool
var dir_value

var rotation_speed : float 

@export var disable = true
	
func _ready() -> void:
	
	if disable:
		return

	_global_datas._end_of_transition.connect(_reset)

	_global_datas.open_owl_view.connect(_start)
	
	
	
	timer.timeout.connect(end_of_time)
	adapt_speed()
	
func _start(condition):
	
	if condition:
		timer.stop()
	else:
		adapt_speed()		
		timer.start()
	
func _reset():

	adapt_speed()	
	
	
func adapt_speed():
	
	var camera_distance = camera.global_position.distance_to(Vector3.ZERO)
	
	rotation_speed = 0.8 / camera_distance * 10	
	
func _process(delta: float) -> void:
	
	if timer.is_stopped():
		return

	
	if disable:
		return
	
	if direction_speed:
		rotation_root.rotation_degrees.y -= rotation_speed * delta
	else:
		rotation_root.rotation_degrees.y += rotation_speed * delta

		
	

func end_of_time():
	direction_speed =! direction_speed	
	timer.start()			
