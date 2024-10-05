extends Node

@export var player_rg : RigidBody3D
@export var line_effects : Array[GPUParticles3D]

func _process(delta):
	
	var speed = player_rg.linear_velocity.length()
	var lerp_ratio = lerp(0,1,speed / 2)
	for fx in line_effects:
		fx.amount_ratio = lerp_ratio	
