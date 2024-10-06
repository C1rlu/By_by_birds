extends Node


const SONAR = preload("res://04_SCENE_MAIN_MAP/00_PLAYER/Sonar/sonar.tscn")
@onready var decor = $"../--DECOR--"


func _ready():
	
	_global_datas._active_sonar.connect(_add_sonar)
	
func _add_sonar(position : Vector3):
	
	var effect = SONAR.instantiate()
	decor.add_child(effect)	
	effect.position = position
