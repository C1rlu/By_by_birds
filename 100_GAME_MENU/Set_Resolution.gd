extends Node


func _ready():
	
	var Distro = OS.get_distribution_name()
	
	print(Distro)
	if Distro == "SteamOS":
		
		set_resolution(1)
	
	if Distro == "Windows":
		set_resolution(0)
			


	
func set_resolution(index):
	
	var current_selected = index
	
	if current_selected == 0:
		
		
		_global_datas.set_resolution.emit(Vector2(1280,720))
		get_window().content_scale_size = Vector2(1280,720)
		RenderingServer.global_shader_parameter_set("Dither_size",0.4)
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		print("SCREEN SIZE",Vector2(1280,720))

	if current_selected == 1:
		_global_datas.set_resolution.emit(Vector2(1280,800))
		get_window().content_scale_size = Vector2(1280,800)
	
		RenderingServer.global_shader_parameter_set("Dither_size",0.4)
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
		print("SCREEN SIZE",Vector2(1280,800))		
		
