extends Node3D

@export var npc_data : Npc_data


func _ready() -> void:

	var utility = GameUtility.new()
	var n_timer = utility.create_timer(0.1,set_data,self)
	n_timer.start()
	
func set_data():
	

	var check_exist = check_if_exist_first() 
	if !check_exist:
		_global_datas.active_focus_view.Npc_datas_list.append(npc_data)


func check_if_exist_first()-> bool:
	
	for data in _global_datas.active_focus_view.Npc_datas_list:
		if data == npc_data:
			return true

	return false  
