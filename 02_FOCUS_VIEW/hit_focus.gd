extends Node

var bird_data : Bird_view_data

func _ready() -> void:
	_global_datas._in_transition_start.connect(start_enable)
	
	
	
func start_enable():
	
	#var utility = GameUtility.new()
	#var timer_n = utility.create_timer(0.3,_enable,self)
	#timer_n.start()
	_enable()
	
func _enable():
	bird_data.bird_col.disabled = false
	bird_data.bird_node.visible = true	

	
func _disable():

	bird_data.bird_node.visible = false
	
	
func _set_focus():
	_global_datas.set_new_focus.emit(bird_data.bird_node)
	_global_datas._in_transition_start.emit()
	bird_data.bird_col.disabled = true
	
	var utility = GameUtility.new()
	var timer_n = utility.create_timer(0.5,_disable,self)
	timer_n.start()
	

	
func get_position():
	return $"../..".global_position
