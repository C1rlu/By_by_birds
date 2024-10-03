extends Node
@onready var Scene = $"../3D_SCENE"

@export var viewports : Array [SubViewport]


func _ready():
	_global_datas.show_3D_BoardScene.connect(_hide_decor)
	_global_datas.show_3D_BoardScene.emit(false)
func _hide_decor(condition : bool):
	
	Scene.visible = condition	

	for v in viewports:
		if condition:
			v.render_target_update_mode = SubViewport.UPDATE_WHEN_VISIBLE
		else:
			v.render_target_update_mode = SubViewport.UPDATE_ONCE
