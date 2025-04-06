extends CharacterBody2D

@onready var right_arm : Sprite2D = $RightArm
@onready var left_arm : Sprite2D = $LeftArm
@onready var hud : CanvasLayer = $Hud


const SPEED = 200.0
const JUMP_VELOCITY = -400.0
var anim :AnimatedSprite2D = null
var dir = false
var health = 10
const MAX_HEALTH = 10

func _ready() -> void:
	anim = get_node("AnimatedSprite2D")
	anim.play("Idle")
	hud.update_health(health)

func _process(delta: float) -> void:
	if abs(velocity.x) > 0:
		anim.play("Moving")
	else:
		anim.play("Idle")
	
	if velocity.x > 0 and dir:
		anim.flip_h = false
		dir = false
	
	if velocity.x < 0 and !dir:
		anim.flip_h = true
		dir = true

func _physics_process(delta: float) -> void:
	# Spin arms while not on ground
	right_arm.spin = true #not is_on_floor()
	left_arm.spin = true #not is_on_floor()
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_robot_hit_box_area_entered(area: Area2D) -> void:
	if area.name == "HeartHitBox":
		health += 1
		if health > MAX_HEALTH:
			health = MAX_HEALTH
		hud.update_health(health)
	if area.name == "BatHitBox" or area.name == "SpiderHitBox":
		$HurtSound.play()
		health -= 0.5 
		hud.update_health(health)
	
	pass # Replace with function body.


func _on_wheel_hit_box_area_entered(area: Area2D) -> void:
	print(area.name)
	if area.name.contains("Landmine"):
		$HurtSound.play()
		health -= 1
		hud.update_health(health)
	pass # Replace with function body.
