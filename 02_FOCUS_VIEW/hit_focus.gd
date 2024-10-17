extends Node

@onready var root : Node3D = $"../.."

@export var _focus_camera : Camera3D
@onready var col: CollisionShape3D = $"../CollisionShape3D"



func _ready() -> void:
	_global_datas._in_transition_start.connect(start_enable)
	
	
	
func start_enable():
	
	var utility = GameUtility.new()
	var timer_n = utility.create_timer(0.3,_enable,self)
	timer_n.start()
	
func _enable():
	col.disabled = false
	root.visible = true	
	
func _disable():
	col.disabled = true
	root.visible = false
	
	
func _set_focus():
	_global_datas.set_new_focus.emit(_focus_camera)
	_global_datas._in_transition_start.emit()
	
	var utility = GameUtility.new()
	var timer_n = utility.create_timer(0.3,_disable,self)
	timer_n.start()
