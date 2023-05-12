extends Node2D

@export var quest_id : int
var scene : String

@onready var game = get_parent().get_parent()

func _on_area_2d_body_entered(body):
	if body.name == "Player" && !Quests.is_quest_done(quest_id):
		game.open_quest(quest_id)
		

func _on_area_2d_body_exited(body):
	if body.name == "Player" && Quests.is_quest_done(quest_id):
		#game.set_quest_done(quest_id, self)
		self.queue_free()
