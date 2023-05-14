extends Node2D

@onready var timer = $Timer
@onready var player = $Player
@onready var quests = $Quests
@onready var canvas_layer = $CanvasLayer
@onready var ui = $CanvasLayer/UI
@onready var confirmation_dialog = $CanvasLayer/ConfirmationDialog
@onready var game_over_panel = $CanvasLayer/GameOverPanel
@onready var start_panel = $CanvasLayer/StartPanel

var waiting_time = 1
var current_quest = null

func _on_start_panel_start_new_game():
	prepare_game()
	timer.one_shot = true
	timer.start(waiting_time)
	
func _on_timer_timeout():
	player.set_position(Global.player_position)
	Global.game_started = true
	Global.can_player_move = true
	
func _on_draw():
	ui.refresh()
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	player.set_position(Global.player_position)
	
func _physics_process(delta):
	if Global.time_left <= 0:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		game_over_panel.visible = true
		Global.can_player_move = false

func open_quest(quest_id):
	current_quest = Quests.get_quest(quest_id)
	Global.can_player_move = false
	
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

func _on_confirmation_dialog_confirmed():
	confirmation_dialog.visible = false;
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	Global.can_player_move = true
	
	if current_quest.scene == "":
		Quests.set_quest_done(current_quest.id)
		ui.refresh()
	else:
		Global.player_position = player.get_position()
		Global.goto_scene(current_quest.scene)


func _on_confirmation_dialog_canceled():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	current_quest = null
	Global.can_player_move = true
	confirmation_dialog.visible = false;


func _on_game_over_panel_start_new_game():
	Global.game_started = false
	prepare_game()
	timer.one_shot = true
	timer.start(waiting_time)
	
func prepare_game():
	Global.can_player_move = false
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	Global.prepare_game()
	Quests.prepare_game()
	player.set_position(Global.player_position)
	for child in quests.find_children("Quest*"):
		child.visible = true
	game_over_panel.visible = false
	ui.refresh()

