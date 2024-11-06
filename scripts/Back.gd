extends Button

func _on_pressed():
	get_tree().change_scene_to_file("res://scenes/Start.tscn")
	get_tree().unload_current_scene()
	
