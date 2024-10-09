extends Node

@onready var render: TextureRect = $"../RENDER"

func _ready() -> void:
	_global_datas.open_book.connect(_open_book)
	
	
func _open_book(condition : bool):
	
	render.visible = condition
	
