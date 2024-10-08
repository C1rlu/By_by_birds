extends Node



@export var Render : TextureRect

@export var cam_root: Node3D 

func _ready() -> void:
	_global_datas._open_focus_view.connect(_reset)
	
	
func _reset(condition : bool):
	pass
	#if condition:
		#cam_root.rotation_degrees = Vector3.ZERO		
	


func _process(delta: float) -> void:
	
	if !Render.visible:
		return
		
	#cam_root.rotation_degrees.y -= 1.0 * delta
