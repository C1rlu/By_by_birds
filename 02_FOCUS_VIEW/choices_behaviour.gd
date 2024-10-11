extends Node


@export var Type_choice_node : Node

var current_text : String

func _add_choice_text(text : String):
	
	current_text = current_text + " " + text	
	Type_choice_node._update_text(current_text)
	
			
	
