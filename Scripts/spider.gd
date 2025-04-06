extends CharacterBody2D
var direction = 1
const SPEED = 5000
var invincible = 0

func _physics_process(delta: float) -> void:
	invincible -= delta
	if direction < 1:
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.flip_h = false
	if is_on_wall():
		direction *= -1
	velocity.x = direction * SPEED * delta
	move_and_slide()
	pass
	


func _on_spider_hit_box_area_entered(area: Area2D) -> void:
	if area.name == "PlayerHitBox":
		invincible = 1
		return
	if (area.name == "AxeHitBox" or area.name == "WheelHitBox") and invincible < 0:
		$HurtSound.play()
	pass # Replace with function body.


func _on_hurt_sound_finished() -> void:
	queue_free()
	pass # Replace with function body.
