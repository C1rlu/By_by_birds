extends Node3D

@onready var col: CollisionShape3D = $Area3D/CollisionShape3D

func _ready() -> void:
	pass
	#_check_if_onboard(true)
	
	#_global_datas._open_desk.connect(_check_if_onboard)
	
#func _check_if_onboard(condition):
	#
	#if condition:
		#visible = Photo_data.discovered
	#
	#col.disabled = !Photo_data.discovered
