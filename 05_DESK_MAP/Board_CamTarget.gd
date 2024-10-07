extends Node3D

@export var speed : float = 0.5
var current_speed : float
@export var min_x : float = -2.0
@export var max_x : float = 2.0
@export var min_z : float = -2.0
@export var max_z : float = 2.0
var border_ratio : float = 22

var target_position : Vector3
var f
var on_auto_move = false

var center_position : Vector3

@onready var render: TextureRect = $"../../RENDER"




func _ready():
	center_position = global_position
	target_position =  center_position

	current_speed = speed

func _process(delta):

	if _global_datas.camera_state_index == 1:
		if render.visible:
			move(delta)	

		

func move(delta):
	var direction = Vector3.ZERO

	if Input.is_action_pressed("move_right"):
		var _magnitude = Input.get_action_strength("move_right")
		direction += global_transform.basis.x * _magnitude  # Move right
	if Input.is_action_pressed("move_left"):
		var _magnitude = Input.get_action_strength("move_left")
		direction -= global_transform.basis.x * _magnitude  # Move left
	if Input.is_action_pressed("move_forward"):
		var _magnitude = Input.get_action_strength("move_forward")
		direction -= global_transform.basis.z * _magnitude  # Move forward
	if Input.is_action_pressed("move_backward"):
		var _magnitude = Input.get_action_strength("move_backward")
		direction += global_transform.basis.z * _magnitude  # Move backward

	# Apply movement
	direction = direction.normalized() * current_speed * delta
	target_position += direction

	# Clamping the position within boundaries
	var lerp_value = (border_ratio - 22.0) / (42.0 - 22.0)
	var oneminus = lerp(1.0, 0.0, lerp_value)
	target_position.x = clamp(target_position.x, oneminus * min_x, oneminus * max_x)
	target_position.z = clamp(target_position.z, oneminus * min_z, oneminus * max_z)

	# Update the global position
	global_transform.origin = target_position



func _focus_this(_position):
	
	on_auto_move = true
	
	if f:
		f.kill()
	
	f = create_tween()
	f.tween_property(self,"position",_position,0.25)
	f.connect("finished",done)
	
func done():
	target_position = global_position
	on_auto_move = false
	
