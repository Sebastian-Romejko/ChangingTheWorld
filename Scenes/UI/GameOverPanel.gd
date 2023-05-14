extends Control

signal start_new_game

@onready var coin_label = $Panel/CoinLabel
@onready var heart_label = $Panel/HeartLabel
@onready var result = $Panel/Result

func _on_ready():
	pass

func _on_button_pressed():
	Global.first_game = false
	start_new_game.emit()

func _on_draw():
	coin_label.text = "- " + str(Global.coin_counter)
	heart_label.text = "+ " + str(Global.heart_counter)
	result.text = "Final score: " + str(Global.heart_counter - Global.coin_counter)
