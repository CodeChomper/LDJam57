extends CanvasLayer

var full = load("res://Sprites/Heart_Full.png")
var half = load("res://Sprites/Heart_Half.png")
var empty = load("res://Sprites/Heart_Empty.png")

var cur_health = 0

func update_health(health : float):
	cur_health = health
	print(cur_health)
	if cur_health >= 10:
		$HBoxContainer/Heart1.texture = full
		$HBoxContainer/Heart2.texture = full
		$HBoxContainer/Heart3.texture = full
		$HBoxContainer/Heart4.texture = full
		$HBoxContainer/Heart5.texture = full
	if cur_health < 10 and cur_health > 9:
		$HBoxContainer/Heart1.texture = full
		$HBoxContainer/Heart2.texture = full
		$HBoxContainer/Heart3.texture = full
		$HBoxContainer/Heart4.texture = full
		$HBoxContainer/Heart5.texture = half
	if cur_health > 8 and cur_health <= 9:
		$HBoxContainer/Heart1.texture = full
		$HBoxContainer/Heart2.texture = full
		$HBoxContainer/Heart3.texture = full
		$HBoxContainer/Heart4.texture = full
		$HBoxContainer/Heart5.texture = empty
	if cur_health > 7 and cur_health <= 8:
		$HBoxContainer/Heart1.texture = full
		$HBoxContainer/Heart2.texture = full
		$HBoxContainer/Heart3.texture = full
		$HBoxContainer/Heart4.texture = half
		$HBoxContainer/Heart5.texture = empty
	if cur_health > 6 and cur_health <= 7:
		$HBoxContainer/Heart1.texture = full
		$HBoxContainer/Heart2.texture = full
		$HBoxContainer/Heart3.texture = full
		$HBoxContainer/Heart4.texture = empty
		$HBoxContainer/Heart5.texture = empty
	if cur_health > 5 and cur_health <= 6:
		$HBoxContainer/Heart1.texture = full
		$HBoxContainer/Heart2.texture = full
		$HBoxContainer/Heart3.texture = half
		$HBoxContainer/Heart4.texture = empty
		$HBoxContainer/Heart5.texture = empty
	if cur_health > 4 and cur_health <= 5:
		$HBoxContainer/Heart1.texture = full
		$HBoxContainer/Heart2.texture = full
		$HBoxContainer/Heart3.texture = empty
		$HBoxContainer/Heart4.texture = empty
		$HBoxContainer/Heart5.texture = empty
	if cur_health > 3 and cur_health <= 4:
		$HBoxContainer/Heart1.texture = full
		$HBoxContainer/Heart2.texture = half
		$HBoxContainer/Heart3.texture = empty
		$HBoxContainer/Heart4.texture = empty
		$HBoxContainer/Heart5.texture = empty
	if cur_health > 2 and cur_health <= 3:
		$HBoxContainer/Heart1.texture = full
		$HBoxContainer/Heart2.texture = empty
		$HBoxContainer/Heart3.texture = empty
		$HBoxContainer/Heart4.texture = empty
		$HBoxContainer/Heart5.texture = empty
	if cur_health > 1 and cur_health <= 2:
		$HBoxContainer/Heart1.texture = half
		$HBoxContainer/Heart2.texture = empty
		$HBoxContainer/Heart3.texture = empty
		$HBoxContainer/Heart4.texture = empty
		$HBoxContainer/Heart5.texture = empty
	if cur_health < 0.2:
		$HBoxContainer/Heart1.texture = empty
		$HBoxContainer/Heart2.texture = empty
		$HBoxContainer/Heart3.texture = empty
		$HBoxContainer/Heart4.texture = empty
		$HBoxContainer/Heart5.texture = empty
		
