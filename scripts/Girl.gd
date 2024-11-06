extends Button

var shared = 0

# פונקציה ללחיצה על הכפתור
func _on_pressed():
	Girl.shared=1
	# מעבר לסצנה אחרת
	get_tree().change_scene_to_file("res://scenes/TileSetSelection.tscn")
