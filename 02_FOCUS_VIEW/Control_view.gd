extends Node

@export var Camera :Camera3D
@export var Render : TextureRect
@export var zoom_speed : float = 0.0
func _ready():
	_global_datas._open_focus_view.connect(_reset)

func _reset(condition):
	
	if condition:
		Camera.fov = 70.0
		

func _process(delta: float) -> void:
	
	if !Render.visible:
		return
		
	if Input.is_action_pressed("Board_zoom_in"):
		Camera.fov -= zoom_speed * delta
	if Input.is_action_pressed("Board_zoom_out"):
		Camera.fov += zoom_speed * delta
		
	Camera.fov = clampf(Camera.fov ,20.0,70.0)	
