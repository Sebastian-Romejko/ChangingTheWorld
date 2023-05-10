extends Node2D

@onready var player = $Player

func open_quest(scene: String):
	Global.player_position = player.get_position()
	Global.goto_scene(scene)

func _on_draw():
	player.set_position(Global.player_position)
