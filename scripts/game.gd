extends Node2D

const VERSION_STRING = "0.0.1a"

# Called when the node enters the scene tree for the first time.
func _ready():
	# make more rubydung-y sky
	RenderingServer.set_default_clear_color(Color(0.5, 0.8, 1.0))
	# make window more nostalgic by making title more rubydung-y
	get_window().title = "mc2d"
	
	# טען את טקסטורת המלבן המותאמת שלך
	var custom_cursor_texture = preload("res://assets/rectangle.png")

	# הגדר את הסמן המותאם אישית
	Input.set_custom_mouse_cursor(custom_cursor_texture)

	# ניתן להגדיר גם עיגון (אופציונלי) אם צריך להזיז את נקודת הקליק
	Input.set_custom_mouse_cursor(custom_cursor_texture, Input.CURSOR_ARROW, Vector2(8, 4))
