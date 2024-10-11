extends Button

@export var choice_text : String = "Set a text"
@onready var Choice_behaviour = $"../Choices_behaviour"


func _ready() -> void:
	
	pressed.connect(choice_this)
	
	text = choice_text
	
func choice_this():
	
	Choice_behaviour._add_choice_text(choice_text)
