extends CharacterBody2D

@onready var sprite = $Sprite2D

@export var move_speed = 100

func _physics_process(_delta):
	var input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up"),
	)
	
	rotate_for_direction(input_direction)
	velocity = input_direction * move_speed
	move_and_slide()

func rotate_for_direction(direction):
	if direction.y > 0:
		self.rotation = 0
	elif direction.y < 0:
		self.rotation = 3.14
	elif direction.x > 0:
		self.rotation = -1.57
	elif direction.x < 0:
		self.rotation = 1.57
