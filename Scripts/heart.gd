extends Node2D


var tween = create_tween()

func _ready() -> void:
	tween.set_loops()
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.tween_property($Sprite2D, "position:y", -6, .5 ).as_relative()
	tween.tween_property($Sprite2D, "position:y", 6, .5).as_relative()

func _on_heart_hit_box_area_entered(area: Area2D) -> void:
	if area.name == "RobotHitBox":
		$PickupSound.play()
		
	pass # Replace with function body.


func _on_pickup_sound_finished() -> void:
	queue_free()
	pass # Replace with function body.
