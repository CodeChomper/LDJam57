extends Sprite2D

var spin : bool = false

func _process(delta: float) -> void:
	if spin:
		rotation += 8 * delta
