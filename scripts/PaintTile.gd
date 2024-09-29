extends TextureRect


# Called when the node enters the scene tree for the first time.
func _ready():
	
	# טען את טקסטורת המלבן המותאמת שלך
	var custom_cursor_texture = preload("res://scenes/gui.tscn::AtlasTexture_vnayp")

	# הגדר את הסמן המותאם אישית
	Input.set_custom_mouse_cursor(custom_cursor_texture)

	# ניתן להגדיר גם עיגון (אופציונלי) אם צריך להזיז את נקודת הקליק
	Input.set_custom_mouse_cursor(custom_cursor_texture, Input.CURSOR_ARROW, Vector2(8, 4))
