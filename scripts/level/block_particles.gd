extends GPUParticles2D

func emit(tex: int):
	var x = tex % 16  # נשאר 16 כי הרוחב נשאר 16
	var y = tex / 16  # הגובה צריך להתאים לגובה החדש של 10 פיקסלים
	print(x * 16)
	print(y * 10)  # יוצר את ההתאמה לגובה של 10
	
	texture = texture.duplicate()
	texture.region.position = Vector2(x * 16 + 8, y * 10 + 5)  # שינוי לפי גובה 10 ורוחב 16
	emitting = true
	$Timer.start()

static func create_emit(parent: Node, point: Vector2, tex: int):
	var emitter = preload("res://scenes/block_particles.tscn").instantiate()
	emitter.position = point
	parent.add_child(emitter)
	emitter.emit(tex)


func _on_timer_timeout():
	queue_free()
