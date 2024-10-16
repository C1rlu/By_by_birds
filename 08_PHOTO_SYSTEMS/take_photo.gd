extends Node

const PHOTO_UI_PREFAB = preload("res://08_PHOTO_SYSTEMS/Photo/Photo_ui_prefab.tscn")
@onready var front_element: Node2D = $"../FRONT_ELEMENT"


func _ready() -> void:
	_global_datas._take_photo.connect(take_photo)

func take_photo():
	
	var photo = PHOTO_UI_PREFAB.instantiate()
	front_element.add_child(photo)
	
	
	
