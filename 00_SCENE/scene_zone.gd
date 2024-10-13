extends Node3D

@export var _focus_data : focus_data 
var zone_element : Array


func _ready() -> void:

	zone_element = get_children()	
	
	_focus_data.fog_of_war_node = self
	
	#check_show_zone()
	
	
	
func check_show_zone():
	
	if _focus_data.scene_resolved:
		
		for e in zone_element:
			if e is Node3D:
				e.show()	
	else:
		for e in zone_element:
			if e is Node3D:
				e.hide()	
	
