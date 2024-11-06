extends Button

var shared_data = 0

# פונקציה ללחיצה על הכפתור
func _on_pressed():
	Boy.shared_data = 1
	# מעבר לסצנה אחרת
	get_tree().change_scene_to_file("res://scenes/TileSetSelection.tscn")
