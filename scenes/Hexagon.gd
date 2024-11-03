extends Button

# פונקציה שתעביר לסצנה הראשית עם TileSet שונה
func load_game_with_tileset(tileset_path):
	# טוענת את סצנת המשחק הראשית
	var main_scene_resource = load("res://scenes/game.tscn")
	if main_scene_resource is PackedScene:
		var main_scene = main_scene_resource.instantiate()
		
		# השגת ה-TileMap מהסצנה ושינוי ה-TileSet שלו
		var tilemap = main_scene.get_node("TileMap")
		if tilemap:
			tilemap.tile_set = load(tileset_path)
		
		# מחליפה את הסצנה הנוכחית עם הסצנה החדשה
		get_tree().current_scene.queue_free()  # מוחקת את הסצנה הנוכחית
		get_tree().current_scene = main_scene  # מקבעת את הסצנה החדשה
		get_tree().root.add_child(main_scene)  # מוסיפה אותה לשורש
		
	else:
		print("Failed to load the main scene as a PackedScene")

# פונקציה שתופעל כשלוחצים על הכפתור
func _on_pressed():
	load_game_with_tileset("res://hexagonterrain.tres")
