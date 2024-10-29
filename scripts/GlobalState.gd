extends Node

# משתנה גלובלי לשמירת מצבי כפתורים
var button_states = {}

# פונקציה לשמירת מצב של כפתור
func set_button_state(key, value):
	button_states[key] = value
	print("Saved button state:", key, "=", value)

# פונקציה לקבלת מצב של כפתור
func get_button_state(key):
	if button_states.has(key):
		return button_states[key]
	return null
