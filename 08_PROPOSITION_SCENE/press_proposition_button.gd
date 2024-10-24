extends Label

@onready var button: Button = $Propositions

	
func _ready() -> void:
	
	button.button_down.connect(_pressed)
	
	visibility_changed.connect(_active_delay)
	
func _set_word(_text : String):
	text = _text
	
func _active_delay(): # to avoid double click event problem
	
	button.disabled = true
	var utility = GameUtility.new()
	var n_timer = utility.create_timer(0.1,enable,self)
	n_timer.start()
	
func enable():
	button.disabled = false
	
func _pressed():
	
	_global_datas._open_proposition.emit(false)
	_global_datas.selected_npc_dialogue._set_dialogue(text)
	_global_datas.check_player_result.emit()
