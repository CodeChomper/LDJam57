extends Node2D
func _ready() -> void:
	$AudioStreamPlayer2D.play()
func _on_animated_sprite_2d_animation_finished() -> void:
	queue_free()
	pass # Replace with function body.
