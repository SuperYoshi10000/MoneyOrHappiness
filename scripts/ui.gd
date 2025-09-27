extends TileMapLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	write($%Player.health, Vector2i(2, 1), 6)
	write($%Player.money, Vector2i(2, 2), 6)
	write($%Player.happiness, Vector2i(2, 3), 6)
	
func write(value: int, pos: Vector2i, length: int):
	var x := pos.x
	var y := pos.y
	var chars: String = String.num_int64(value)
	for i in range(length):
		if i >= chars.length(): set_cell(Vector2i(x, y))
		else: set_cell(Vector2i(x, y), tile_set.get_source_id(0), Vector2i(chars[i].to_int(), 3))
		x += 1
