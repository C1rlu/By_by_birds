extends Node

@export var Particule : GPUParticles3D

func _ready() -> void:
	
	
	var utility = GameUtility.new()
	var timer_n = utility.create_timer(0.25,stop_particule,self)
	timer_n.start()
	
func stop_particule():
	Particule.speed_scale = 0.0	
