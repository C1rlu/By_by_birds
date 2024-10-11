extends Node


@export var Label_text : Label

var t 

var _previous_text : String
var _previous_ratio : float 

func _update_text(_legend: String):
	
	Label_text.text = _legend
	
	
	var text_count = _legend.length()
	
	if _previous_text:
		var n = calculate_legend_ratio(_previous_text,_legend)
		_previous_ratio = n
		print(n)
	_previous_text = _legend
	type_text(text_count)

func calculate_legend_ratio(previous_legend: String, new_legend: String) -> float:
	var previous_length = previous_legend.length()
	var new_length = new_legend.length()
	
	
	# Calculate the ratio of the new legend compared to the previous one
	var new_ratio = float(previous_length) / float(new_length)

	# Calculate the remaining ratio for the previous legend
	var s = snapped(new_ratio, 0.01)
	var previous_ratio = s 
	
	return previous_ratio



func type_text(count : int):
	
	Label_text.visible_ratio = 0.0
	var speed = 0.01 * count

	if t:
		t.kill()
	t = create_tween()
	t .tween_method(change_ration,_previous_ratio,1.0,speed)



func change_ration(value : float):
	Label_text.visible_ratio = value
	
