extends Node


@export var Render : TextureRect

@export var Camera : Camera3D


var disable = true

func _ready() -> void:
	pass	
	#_global_datas.set_new_focus.connect(_reset)
	
	
func _reset(camera):
	
	Camera.rotation.y = 0.0



func _input(event: InputEvent) -> void:
	
	#if disable:
		#return
	#if !Render.visible:
		#return
		
	if event is InputEventMouseMotion:
		print(event.relative.x)
		Camera.rotation_degrees.y += deg_to_rad(-event.relative.x * 8.0)
		Camera.rotation_degrees.x += deg_to_rad(-event.relative.y * 8.0)
		#Camera.rotation.y = clamp(Camera.rotation.y ,deg_to_rad(-60.0),deg_to_rad(60.0))
		Camera.rotation.x = clamp(Camera.rotation.x ,deg_to_rad(-80.0),deg_to_rad(180.0))

	
func _old():
	pass
	#
	#Camera.rotate_y(deg_to_rad(-event.relative.x * 0.25))
	#Camera_head.rotate_x(deg_to_rad(-event.relative.y * 0.25))
#
	#Camera.rotation.y = clamp(Camera.rotation.y ,deg_to_rad(-60.0),deg_to_rad(60.0))
	#Camera_head.rotation.x = clamp(Camera_head.rotation.x ,deg_to_rad(-60.0),deg_to_rad(60.0))
