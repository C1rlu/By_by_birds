extends Node

@onready var book: Node3D = $"../BOOK"
@onready var book_prefab_12: Node3D = $"../BookPrefab12"

@onready var book_area_col : CollisionShape3D = $"../BookPrefab12/Book/Book_01/Book_area/CollisionShape3D"


func _ready() -> void:
	_global_datas.open_book_board.connect(open_condition)
	
	
func open_condition(condition : bool):
	
	book.visible = condition	
	book_prefab_12.visible = !condition
	book_area_col.disabled = condition
