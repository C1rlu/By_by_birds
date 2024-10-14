extends RigidBody3D

@export var rotation_bird : Node3D
@export var move_speed: float = 5.0
@export var maxSpeed = 10.0
@export var rotation_speed = 0.5
@export var Raycast : RayCast3D
@export var max_roll_angle : float = 30.0
@export var rool_speed : float = 5.0
@export var decal_shadow : Decal


@onready var timer = $Timer
var y_position_value : float
var height_offset : float
var target_roll : float 
var is_rolling

var random_dir : Vector3
var dir_index : int = 0
func _ready():
	
	
	
	y_position_value = position.y   
	height_offset = position.y
	
	_global_datas._roll_bird.connect(_rool_bird)
	timer.timeout.connect(timer_udpate)
		
	if position == Vector3.ZERO:
		position = Vector3(0.0,2.5,0.0)
	else:
		position	 = _global_datas.player_position
	
func _physics_process(_delta):
		
	var translation = get_global_transform().origin
	_global_datas.player_position = translation
	

	move_c()
	
	apply_roll(_delta)
	_rotate_in_direction(_delta)	
	_adapth_heights(_delta)
	
	check_raycast()
	
func move_c():
	
		
	var velocity = Input.get_vector("move_right", "move_left","move_backward" , "move_forward")
	 # Calculate the torque based on input velocity
	if velocity.length_squared() > 0.0:	
		var target_rotation = atan2(velocity.x, velocity.y)
		# Calculate direction vector in X-Z plane based on rotation
		var direction_x = sin(target_rotation)
		var direction_z = cos(target_rotation)
		# Create a 3D vector for the force direction (assuming Y-axis is up)
		var force_direction = Vector3(-direction_x, 0.0, -direction_z).normalized()
		# Apply central force in the calculated direction
		apply_central_force(force_direction * move_speed)
		timer.stop()
	else:
		_player_not_active()
		
			
func _player_not_active():

	apply_central_force(random_dir * move_speed)
	if timer.is_stopped():
		timer_udpate()
		timer.start()
			
				
func timer_udpate():
	
	dir_index += 1
	if dir_index == 4:
		dir_index = 0

	if dir_index == 0:
		random_dir = Vector3.RIGHT
	if dir_index == 1:
		random_dir = Vector3.FORWARD
	if dir_index == 2:
		random_dir = Vector3.LEFT
	if dir_index == 3:
		random_dir = Vector3.BACK
		
func _rotate_in_direction(_delta):
	# Get the direction of the velocity
	var direction = linear_velocity.normalized()
	

	var target_direction = atan2(-direction.x,-direction.z)
	rotation_bird.rotation.y = lerp_angle(rotation_bird.rotation.y,target_direction, _delta * rotation_speed)
	decal_shadow.rotation.y = lerp_angle(rotation_bird.rotation.y,target_direction, _delta * rotation_speed)
func apply_roll(delta: float):
	
	
	var velocity_direction = linear_velocity.normalized()
	var forward_direction = global_transform.basis.z.normalized()
	var angle_to_velocity = velocity_direction.angle_to(forward_direction)
	var turn_sign = sign(velocity_direction.cross(forward_direction).y)
	
	if is_rolling:
		return
	if abs(angle_to_velocity) < 0.1: 
		target_roll = 0.0
	else:
		target_roll = clamp(turn_sign * angle_to_velocity * rool_speed,-deg_to_rad(max_roll_angle), deg_to_rad(max_roll_angle))
	

	var current_roll = rotation_bird.rotation.z

	current_roll = lerp(current_roll, rad_to_deg(target_roll), delta * rool_speed)
	rotation_bird.rotation.z = current_roll


func _adapth_heights(_delta):
	
	
	position.y = lerp(position.y,y_position_value,_delta * 1.0)
	

func _rool_bird():
	is_rolling = true
	var t
	var random_v = randf_range(-7.0,7.0)
	t = create_tween()
	t.tween_method(_rool_z,rotation_bird.rotation.z,random_v,0.5)
	t.connect("finished",done)
	
func done():
	is_rolling = false	
	
func _rool_z(value):
	rotation_bird.rotation.z = value	
		
func check_raycast():
	
	if Raycast.is_colliding():

		var col = Raycast.get_collision_point()
		var y_height = col.y
		y_position_value = height_offset + y_height
		_global_datas.bird_raycast_ground_position = Vector3(position.x,y_height,position.z)
	else:
		y_position_value = height_offset		
