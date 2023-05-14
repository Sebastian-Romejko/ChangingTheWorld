extends Node2D

@onready var car = $Car

@export var quest_id: int

func _on_destination_body_entered(body):
	if body == car:
		Quests.set_quest_done(quest_id)
		Global.goto_main_scene()
