extends CharacterBody2D

var player
static var SPEED : float = 5000
@onready var anim : AnimatedSprite2D = $AnimatedSprite2D

func _on_sense_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		player = body
		anim.play("Flying")

func _physics_process(delta: float) -> void:
	if player != null:
		var direction = (player.global_position - global_position).normalized()
		velocity = direction * SPEED * delta
		print("moving towards you")
		pass
	move_and_slide()
		
