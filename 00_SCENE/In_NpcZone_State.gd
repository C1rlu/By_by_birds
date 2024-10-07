extends Node

@export var bird_data : Npc_datas

func _ready():
	_global_datas._active_this_npc_zone.connect(_active)

func _active(condition : bool):

	
	var Npc_zone = _global_datas.Npc_Dialogue

	if !Npc_zone:
		return
		
	_global_datas.in_dialogue_zone.emit(condition)
		

	
