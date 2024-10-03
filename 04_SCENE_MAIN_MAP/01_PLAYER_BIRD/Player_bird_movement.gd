extends RigidBody3D

@export var rotation_bird : Node3D
@export var move_speed: float = 5.0
@export var maxSpeed = 10.0
@export var rotation_speed = 0.5
@export var Raycast : RayCast3D
var y_position_value : float

var height_offset : float

signal player_flying(condition : bool)

func _ready():
	
	y_position_value = position.y   
	height_offset = position.y


		
func _physics_process(_delta):
	

	var translation = get_global_transform().origin
	_global_datas.player_position = translation

	if _global_datas.Player_InMenu:
		return
		
	if _global_datas.Player_InDialogue:
		return	
	
	if _global_datas.photo_checking:
		return
			

	move_c()
	_rotate_in_direction(_delta)	
	check_raycast()
	_adapth_heights(_delta)
	
	
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
		player_flying.emit(true)
	else:
		player_flying.emit(false)
	
	
	

func _rotate_in_direction(_delta):
	# Get the direction of the velocity
	var direction = linear_velocity.normalized()
	

	var target_direction = atan2(-direction.x,-direction.z)
	rotation_bird.rotation.y = lerp_angle(rotation_bird.rotation.y,target_direction, _delta * rotation_speed)
	#print(rotation_bird.rotation.y)

func _adapth_heights(_delta):
	
	
	position.y = lerp(position.y,y_position_value,_delta * 1.0)
	
func check_raycast():
	
	if Raycast.is_colliding():
		#print(Raycast.get_collision_point())
		var col = Raycast.get_collision_point()
		var y_height = col.y
		y_position_value = height_offset + y_height
	
