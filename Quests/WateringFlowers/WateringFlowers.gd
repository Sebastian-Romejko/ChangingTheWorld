extends Node2D

@onready var watering_can = $WateringCan
@onready var flowers = $Flowers

@export var quest_id: int
@export var flowers_to_water: int

var watered_flowers = 0

func _input(event):
	if event is InputEventMouseButton:
		var mouse_event = event as InputEventMouseButton
		if mouse_event.button_index == MOUSE_BUTTON_LEFT && mouse_event.pressed:
			if flowers.hovered_object != null && flowers.can_water():
				watering_can.run_watering_animation()
				flowers.set_flower_watered()
				watered_flowers += 1
				if watered_flowers == flowers_to_water:
					Quests.set_quest_done(quest_id)
					Global.goto_main_scene()
	
