extends Node

var main_scene = "res://Scenes/Game.tscn"
var player_position: Vector2 = Vector2(300, 50)
var current_scene = null

var coin_counter = 100
var heart_counter = 0
var time_left = 60

func _physics_process(delta):
	time_left -= delta

func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() - 1)

func goto_scene(path):
	call_deferred("_deferred_goto_scene", path)
	
func goto_main_scene():
	call_deferred("_deferred_goto_scene", main_scene)

func _deferred_goto_scene(path):
	current_scene.free()
	
	var s = ResourceLoader.load(path)
	current_scene = s.instantiate()
	get_tree().get_root().add_child(current_scene)
	get_tree().set_current_scene(current_scene)
