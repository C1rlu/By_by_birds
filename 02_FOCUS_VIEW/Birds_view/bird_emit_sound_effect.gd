extends Node
const BIRD_NOISE_EFFECT = preload("res://02_FOCUS_VIEW/VFX/Bird_Noise_Effect.tscn")

@export var parent_root : Node3D


func _emit_fx():
	set_new_waitTime()
	var fx = BIRD_NOISE_EFFECT.instantiate()
	parent_root.add_child(fx)
	fx.global_position = parent_root.global_position
	fx.scale = Vector3.ONE
	print("EMIT SOUND")

func set_new_waitTime():
	var wait_time = randf_range(2.0,8.0)
	$Timer.wait_time = wait_time
