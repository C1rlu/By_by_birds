extends Node3D

@export var Focus_data : focus_data
@onready var col: CollisionShape3D = $Area3D/CollisionShape3D


func _ready() -> void:
	_check_if_onboard(true)
	
	_global_datas._open_desk.connect(_check_if_onboard)
	
func _check_if_onboard(condition):
	
	if condition:
		visible = Focus_data.scene_resolved	
	
	col.disabled = !Focus_data.scene_resolved	
