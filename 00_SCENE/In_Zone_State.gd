extends Node




func _ready():
	
	_global_datas._check_zone_enter.connect(_check_zone_enter)	
	_global_datas._check_zone_exit.connect(_check_zone_exit)
	
	_global_datas._check_player_zone.connect(check_zone)
	
	_global_datas._close_dialogue.connect(check_zone)
	_global_datas._open_menu.connect(_condition_check)
	
func _condition_check(condition):
	
	if !condition:	
		check_zone()	
	
func _check_zone_enter(area):
	
	var npc_zone = area.get_node_or_null("Npc_zone")
	if npc_zone:
		_global_datas.Npc_Dialogue = npc_zone.get_npc()
		_global_datas._active_this_npc_zone.emit(true)
		
	var focus_zone = area.get_node_or_null("Focus_zone")
	if focus_zone:
		_global_datas.current_focus_data = focus_zone.Focus_data
		if !_global_datas.current_focus_data.scene_resolved: 
			_global_datas._in_focus_zone.emit(true)
		else:
			_global_datas._in_focus_zone.emit(false)
		
			
	var delevery_zone = area.get_node_or_null("Delevery_zone")
	if delevery_zone:
		_global_datas._in_desk_zone.emit(true)	
	
func _check_zone_exit(area):
	
	var npc_zone = area.get_node_or_null("Npc_zone")
	if npc_zone:
		_global_datas._active_this_npc_zone.emit(false)
		_global_datas._check_player_zone.emit()
		
	var focus_zone = area.get_node_or_null("Focus_zone")
	if focus_zone:
		_global_datas._in_focus_zone.emit(false)	
	
			
	var delevery_zone = area.get_node_or_null("Delevery_zone")
	if delevery_zone:
		_global_datas._in_desk_zone.emit(false)	
			
func check_zone():
	
	
	var all_area = _global_datas.player_area.get_overlapping_areas()
	for a in all_area:
		var npc_zone = a.get_node_or_null("Npc_zone")
		if npc_zone:
			_global_datas.Npc_Dialogue = npc_zone.get_npc()
			_global_datas._active_this_npc_zone.emit(true)
			
		var focus_zone = a.get_node_or_null("Focus_zone")
		if focus_zone:
			_global_datas.current_focus_data = focus_zone.Focus_data
			if !_global_datas.current_focus_data.scene_resolved: 
				_global_datas._in_focus_zone.emit(true)
			else:
				_global_datas._in_focus_zone.emit(false)
				
		var delevery_zone = a.get_node_or_null("Delevery_zone")
		if delevery_zone:
			_global_datas._in_desk_zone.emit(true)	
