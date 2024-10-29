extends Button

# פונקציה שתעביר לסצנה הראשית עם TileSet לפי המצב השמור
func load_scene_with_tileset(tileset_path):
	print("Loading game scene with tileset...")
	var main_scene_resource = load("res://game.tscn")
	if main_scene_resource is PackedScene:
		var main_scene = main_scene_resource.instantiate()
		
		# השגת ה-TileMap מהסצנה ושינוי ה-TileSet שלו
		var tilemap = main_scene.get_node("TileMap")
		if tilemap:
			tilemap.tile_set = load(tileset_path)
		
		# מחליפה את הסצנה הנוכחית עם הסצנה החדשה
		if get_tree().current_scene:
			get_tree().current_scene.queue_free()  # מוחקת את הסצנה הנוכחית
		get_tree().current_scene = main_scene  # מקבעת את הסצנה החדשה
		get_tree().root.add_child(main_scene)  # מוסיפה אותה לשורש
		
	else:
		print("Failed to load the main scene as a PackedScene")

# פונקציה שתופעל כשלוחצים על הכפתור
func _on_pressed():
	print("Trying to retrieve tileset...")
	
	# שמירת מצב הכפתור ב־GlobalState
	GlobalState.set_button_state("selected_tileset", "res://rectangleerrain.tres")
	print("Saved selected tileset in GlobalState.")
	
	# ניסיון לטעון את ה־TileSet השמור
	var saved_tileset = GlobalState.get_button_state("selected_tileset")
	print("Retrieved tileset:", saved_tileset)
	if saved_tileset:
		load_scene_with_tileset(saved_tileset)
	else:
		load_scene_with_tileset("res://rectangleerrain.tres")
