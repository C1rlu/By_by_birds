extends Node

@onready var flash_effect_panel: ColorRect = $"../FLASH_EFFECT_PANEL"
@onready var flash_effect_panel_mat : Material = flash_effect_panel.get_material()

func _ready() -> void:
	_global_datas._take_photo.connect(_flash_effect)
	

func _flash_effect():
	var fade
	fade = create_tween()	
	fade.tween_method(_flash,1.0,0.0,1.0)
	
func _flash(value : float):
	flash_effect_panel_mat.set_shader_parameter("Opacity", value)
