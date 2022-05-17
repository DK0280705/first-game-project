extends Sprite

func _process(delta) -> void:
	position.x += -40 * delta
	if position.x < -1280:
		position.x += 1280
