extends Node

@export var area_trigger : Area3D

func _ready():

	area_trigger.area_entered.connect(_check_area_zone)
	area_trigger.area_exited.connect(_exit_check_area)
	
		
func _check_area_zone(area):
	
	if area:
		var zone = area.get_node_or_null("Zone")

		if zone:
			_global_datas._check_zone_enter.emit(area)
	
		var Show_me = area.get_node_or_null("Show_me")
		if Show_me:
			Show_me.show_me.emit()

func _exit_check_area(area):
	
	if area:
		var zone = area.get_node_or_null("Zone")
		if zone:
			_global_datas._check_zone_exit.emit(area)
	
		
