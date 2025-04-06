extends RigidBody2D
var obj_hitting = 0
var col_time = 0

var exploding_dirt = preload("res://LevelObjects/exploding_dirt.tscn")

func _on_dirt_hit_box_area_entered(area: Area2D) -> void:
	if area.name == "AxeHitBox":
		break_block()
		return
	if area.name == "WheelHitBox" or area.name == "RobotHitBox":
		obj_hitting += 1
	pass # Replace with function body.

func _on_dirt_hit_box_area_exited(area: Area2D) -> void:
	if area.name == "WheelHitBox" or area.name == "RobotHitBox":
		obj_hitting -= 1
	if obj_hitting < 0:
		obj_hitting = 0
	pass # Replace with function body.

func _process(delta: float) -> void:
	if obj_hitting > 0:
		col_time += delta
	else:
		col_time = 0
	
	if col_time > 0.25:
		break_block()

func break_block():
	
	var explode = exploding_dirt.instantiate()
	self.get_parent().add_child(explode)
	explode.global_position = global_position
	queue_free()
