extends Button


func _ready() -> void:
	
	pressed.connect(_pressed)
	
	
	
func _pressed():
	
	_global_datas.in_photo_mode.emit(true)
	_global_datas._open_journal.emit(false)
