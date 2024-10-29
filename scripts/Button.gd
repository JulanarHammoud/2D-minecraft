extends Button

# פונקציה שתופעל כאשר לוחצים על הכפתור
func _on_pressed():
	print("Exiting game...")
	get_tree().quit()
