extends Node

var quests: Array

func _init():
	var json_file = FileAccess.open("res://Quests/Quests.json", FileAccess.READ).get_as_text()
	quests = JSON.parse_string(json_file)

func set_quest_done(id: int):
	var quest = quests[id - 1]
	Global.coin_counter -= quest.cost
	Global.heart_counter += quest.reward
	quest.is_done = true

func get_quest(id: int):
	return quests[id - 1]

func is_quest_done(id: int):
	return quests[id - 1].is_done
