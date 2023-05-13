extends Node2D

var hovered_object: Sprite2D
var watered_flowers: Array

func _on_ready():
	for child in find_children("Flower*"):
		child.set_meta("type", "flower")

func set_flower_watered():
	watered_flowers.append(hovered_object.flower_id)
	hovered_object.modulate = Color(1, 1, 1)

func can_water():
	if watered_flowers.has(hovered_object.flower_id):
		return false
	else:
		return true
