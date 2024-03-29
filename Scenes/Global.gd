extends Node

var default_time_left = 120
var default_coin_counter = 250
var default_heart_counter = 0
var default_player_position: Vector2 = Vector2(300, 50)

var first_game = true
var game_started = false
var main_scene = "res://Scenes/Game.tscn"
var current_scene = null

var time_left
var coin_counter = 100
var heart_counter = 0
var player_position: Vector2
var can_player_move = false

func _physics_process(delta):
	if game_started:
		time_left -= delta

func _ready():
	prepare_game()
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() - 1)

func goto_scene(path):
	call_deferred("_deferred_goto_scene", path)
	
func goto_main_scene():
	can_player_move = true
	call_deferred("_deferred_goto_scene", main_scene)

func _deferred_goto_scene(path):
	current_scene.free()
	
	var s = ResourceLoader.load(path)
	current_scene = s.instantiate()
	get_tree().get_root().add_child(current_scene)
	get_tree().set_current_scene(current_scene)

func prepare_game():
	time_left = default_time_left
	coin_counter = default_coin_counter
	heart_counter = default_heart_counter
	player_position = default_player_position
	
