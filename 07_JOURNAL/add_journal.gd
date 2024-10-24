extends Node


const JOURNAL_PREFAB = preload("res://07_JOURNAL/journal_prefab.tscn")

func _ready() -> void:
	
	_global_datas._add_journal.connect(_journal)

func _journal():
	
	var journal = JOURNAL_PREFAB.instantiate()
	self.add_child(journal)	
	 
