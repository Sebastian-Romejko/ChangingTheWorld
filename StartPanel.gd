extends Control

signal start_new_game

@onready var start_button = $Panel/Button
@onready var timer = $Timer

func _on_ready():
	if Global.first_game:
		timer.start(1)
	else:
		Global.game_started = true
		close_panel()

func _on_timer_timeout():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	start_button.visible = true
	
func _on_button_pressed():
	start_new_game.emit()
	close_panel()
	
func close_panel():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	self.queue_free()
	
