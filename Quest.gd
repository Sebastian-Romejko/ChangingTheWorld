extends Node2D

@export var quest_id : int
@export var scene : String # TODO: Choose scene from config file based in id

@onready var game = get_parent().get_parent()

func _on_area_2d_body_entered(body):
	if(body.name == "Player" && !Quests.quests_done.has(quest_id)):
		game.open_quest(scene)
