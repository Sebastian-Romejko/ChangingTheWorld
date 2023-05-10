extends Node2D

@export var quest_id: int

func _input(event):
	if event is InputEventMouseButton:
		var mouse_event = event as InputEventMouseButton
		if mouse_event.button_index == MOUSE_BUTTON_LEFT && mouse_event.pressed:
			Quests.set_quest_done(quest_id)
			Global.goto_main_scene()
