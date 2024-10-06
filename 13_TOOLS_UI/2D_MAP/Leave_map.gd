extends Button



func _ready():
	pressed.connect(leave_map)

func leave_map():
	_global_datas._open_player_map.emit(false)	
	
