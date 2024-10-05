extends TileMap

const BlockParticles = preload("res://scripts/level/block_particles.gd")

@export var width := 256
@export var height := 64
@export var zombie_count := 10

var lightmap = []

@export var noise: FastNoiseLite
@export var cliff_noise: FastNoiseLite
@export var cliff_compare_noise: FastNoiseLite

const ZOMBIE = preload('res://scenes/zombie.tscn')

var is_generating = true

func _ready():
	_generate_noise_seeds()
	clear_layer(1)

	_spawn_zombies(zombie_count)

	if not load_level():
		_generate_level()
		update_lightmap()

	is_generating = false


func _generate_noise_seeds():
	noise.seed = randi()
	cliff_noise.seed = randi()
	cliff_compare_noise.seed = randi()


func _spawn_zombies(count):
	for i in range(count):
		spawn_zombie(Vector2(randf() * width * 16, -height * 16))


func spawn_zombie(point: Vector2):
	var zombie = ZOMBIE.instantiate()
	zombie.position = point
	get_parent().add_child.call_deferred(zombie)


func _generate_level():
	for x in range(width):
		for y in range(height):
			if y % 2 == 0:
				place_tile(Vector2i(x, y), Tiles.STONE.tex)
			elif x > 0:
				place_tile(Vector2i(x - 1, y), Tiles.STONE.tex)


func place_tile(point: Vector2i, type: int):
	if point.x < 0 or point.x >= width or point.y < 0 or point.y >= height:
		return

	clear_layer(1)

	if type < 1:
		set_cell(0, point, 0)
	else:
		var x = type % 16
		var y = type / 16
		set_cell(0, point, 0, Vector2i(x, y))

		if not is_generating:
			update_lightmap()


func get_tile(point: Vector2i):
	if point.x < 0 or point.x >= width or point.y < 0 or point.y >= height:
		return 0

	var cell = get_cell_atlas_coords(0, point)
	return cell.y * width + cell.x


func destroy_tile(point: Vector2i):
	var tex = get_tile(point)
	BlockParticles.create_emit(get_parent(), map_to_local(point), tex)
	place_tile(point, 0)


func update_lightmap():
	clear_layer(1)
	lightmap.clear()
	lightmap.resize(width)

	for x in range(width):
		var y = 0
		while y < height and not is_light_blocker(x, y):
			y += 1

		for y1 in range(y + 1, height):
			if not is_light_blocker(x, y1 - 1) and is_solid(x, y1):
				set_cell(1, Vector2i(x, y1), 1, Vector2i(0, 0))

		lightmap[x] = y

	clear_layer(1)  # מנקה שכבת אור מיותרת אחרי העדכון


func is_lit(x: int, y: int):
	if x < 0 or x >= len(lightmap):
		return true
	return y <= lightmap[x]


func is_light_blocker(x: int, y: int):
	var tile = Tiles.get_tile(get_tile(Vector2i(x, y)))
	return tile != null and tile.is_light_blocker()


func is_solid(x: int, y: int):
	var tile = Tiles.get_tile(get_tile(Vector2i(x, y)))
	return tile != null and tile.is_solid()


func load_level():
	if not FileAccess.file_exists("level.dat"):
		return false

	var file = FileAccess.open("level.dat", FileAccess.READ)

	for i in range(width):
		for j in range(height):
			var b = file.get_8()
			place_tile(Vector2i(i, j), b)

	update_lightmap()
	file.close()

	is_generating = false
	return true


func save_level():
	var file = FileAccess.open("level.dat", FileAccess.WRITE)

	for i in range(width):
		for j in range(height):
			var b = get_tile(Vector2i(i, j))
			file.store_8(b if b >= 0 else 0)

	file.close()


func _process(delta):
	for i in range(width * height / 400):
		var x = randi_range(0, width - 1)
		var y = randi_range(0, height - 1)

		var tile = Tiles.get_tile(get_tile(Vector2i(x, y)))
		if tile:
			tile.tick(self, x, y)


func _notification(what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		save_level()
