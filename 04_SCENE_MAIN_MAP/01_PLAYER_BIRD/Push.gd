extends Node

@export var player_rg : RigidBody3D
func _ready():

	_global_datas._roll_bird.connect(push)
	
	
func push():
	
	var dir = player_rg.linear_velocity
	player_rg.apply_force(dir * 200)
	
