extends Node

@onready var root: Node3D = $"../.."


func get_focus_data():
	
	return root.Focus_data
