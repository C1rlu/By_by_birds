extends RigidBody3D


@export var move_speed: float = 5.0
var speed : float
@export var maxSpeed = 10.0
@export var rotation_speed = 0.5

var using_pad : bool

var _lock_speed : bool = false
var y_position_value : float

func _ready():
	
	_global_datas.using_pad.connect(_using_pad)
	speed = move_speed

	y_position_value = position.y   
	
func _using_pad(condition : bool):
	
	using_pad = condition	
func lock_speed(condition : bool):
	
	_lock_speed = condition
	
	if condition:
		speed = move_speed
				
func _input(event):
	
	
	if event.is_action_pressed("Speed_boat"):
		if !_lock_speed:
			speed = move_speed * 2	
	
	if event.is_action_released("Speed_boat"):
		speed = move_speed
		
		

	
func _physics_process(_delta):
	

	var translation = get_global_transform().origin
	_global_datas.player_position = translation

	if _global_datas.Player_InMenu:
		return
		
	if _global_datas.Player_InDialogue:
		return	
	
	if _global_datas._photo_checking:
		return
			
	
	
	move_c()
	

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
		apply_central_force(force_direction * speed)


	
		
	position.y = y_position_value
	
		


