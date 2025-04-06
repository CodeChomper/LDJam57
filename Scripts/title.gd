extends Node2D

var tween = create_tween()

func _ready() -> void:
	tween.set_loops()
	tween.set_trans(Tween.TRANS_BOUNCE)
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.tween_property($Sprite2D, "modulate", Color(1,0,0,0.2), 1 )
	tween.tween_property($Sprite2D, "modulate", Color(1,0,0,0.7), 1)
