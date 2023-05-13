extends CharacterBody2D

enum STATE { IDLE, WALK }

@export var move_speed : float = 10
@export var idle_time_from : float = 1
@export var idle_time_to : float = 2
@export var walk_time_from : float = 3
@export var walk_time_to : float = 5

@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")
@onready var sprite = $Sprite2D
@onready var timer = $Timer

var move_direction : Vector2 = Vector2.ZERO
var current_state : STATE = STATE.IDLE

func _physics_process(_delta):
	if(current_state == STATE.WALK):
		velocity = move_direction * move_speed
		move_and_slide()

func select_new_direction():
	var rng = RandomNumberGenerator.new()
	move_direction = Vector2(
		randi_range(-1,1),
		rng.randf_range(-0.2, 0.2),
	)
		
func pick_new_state():
	if(current_state == STATE.WALK):
		state_machine.travel("idle")
		current_state = STATE.IDLE
		timer.start(randi_range(idle_time_from, idle_time_to))
	elif(current_state == STATE.IDLE):
		state_machine.travel("walk")
		current_state = STATE.WALK
		select_new_direction()
		animation_tree.set("parameters/walk/blend_position", move_direction)
		timer.start(randi_range(walk_time_from, walk_time_to))

func _on_timer_timeout():
	pick_new_state()
