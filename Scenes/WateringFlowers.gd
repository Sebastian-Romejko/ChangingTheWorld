extends Node2D

@export var quest_id: int
@export var watering_can: Node2D
@export var flowers_to_water: int

var watered_flowers = 0
var is_flower_hovered = false

func _input(event):
	if event is InputEventMouseButton:
		var mouse_event = event as InputEventMouseButton
		if mouse_event.button_index == MOUSE_BUTTON_LEFT && mouse_event.pressed:
			if is_flower_hovered:
				watered_flowers += 1
				if watered_flowers == flowers_to_water:
					Quests.set_quest_done(quest_id)
					Global.goto_main_scene()


func _on_trash_bin_mouse_entered():
	is_flower_hovered = true


func _on_trash_bin_mouse_exited():
	is_flower_hovered = false
