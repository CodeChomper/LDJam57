extends CharacterBody2D

var player
static var SPEED : float = 5000
var invincible = 0
@onready var anim : AnimatedSprite2D = $AnimatedSprite2D

func _on_sense_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		player = body
		anim.play("Flying")
		$TakeOffSound.play()

func _physics_process(delta: float) -> void:
	invincible -= delta
	if player != null:
		var direction = (player.global_position - global_position).normalized()
		velocity = direction * SPEED * delta
		pass
	move_and_slide()

func _on_bat_hit_box_area_entered(area: Area2D) -> void:
	if area.name == "AxeHitBox" and invincible < 0:
		$HurtSound.play()
	if area.name == "RobotHitBox":
		invincible = 1
		
	pass # Replace with function body.


func _on_take_off_sound_finished() -> void:
	$TakeOffSound.play()
	pass # Replace with function body.


func _on_hurt_sound_finished() -> void:
	queue_free()
	pass # Replace with function body.
