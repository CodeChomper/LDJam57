extends Area2D
var anim : AnimatedSprite2D

func _ready() -> void:
	anim = get_node("AnimatedSprite2D")
	anim.play("Armed")

func _on_body_entered(body: Node2D) -> void:
	print("Landmine hit")
	anim.scale = Vector2(4,4)
	anim.play("Explode")
	pass # Replace with function body.

func _on_animated_sprite_2d_animation_finished() -> void:
	if anim.animation == "Explode":
		queue_free()
	pass # Replace with function body.
