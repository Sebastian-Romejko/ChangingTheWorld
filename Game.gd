extends Node2D

@onready var player = $Player
@onready var canvas_layer = $CanvasLayer
@onready var ui = $CanvasLayer/UI
@onready var confirmation_dialog = $CanvasLayer/ConfirmationDialog
@onready var game_over_panel = $CanvasLayer/GameOverPanel

var current_quest = null

func _physics_process(delta):
	if Global.time_left <= 0:
		game_over_panel.visible = true
		player.can_move = false

func open_quest(quest_id):
	current_quest = Quests.get_quest(quest_id)
	player.can_move = false
	
	confirmation_dialog.visible = true
	confirmation_dialog.title = current_quest.title
	confirmation_dialog.dialog_text = get_current_quest_message()
	if current_quest.cost > Global.coin_counter:
		confirmation_dialog.get_ok_button().disabled = true
	else:
		confirmation_dialog.get_ok_button().disabled = false
		
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
func get_current_quest_message():
	return current_quest.message % [str(current_quest.cost), str(current_quest.reward)]

func _on_draw():
	ui.refresh()
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	player.set_position(Global.player_position)

func _on_confirmation_dialog_confirmed():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	confirmation_dialog.visible = false;
	player.can_move = true
	Global.player_position = player.get_position()
	Global.goto_scene(current_quest.scene)


func _on_confirmation_dialog_canceled():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	current_quest = null
	player.can_move = true
	confirmation_dialog.visible = false;
