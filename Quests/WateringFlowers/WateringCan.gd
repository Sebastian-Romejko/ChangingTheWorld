extends Sprite2D

@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")

func _input(event):
	if event is InputEventMouseMotion:
		var mouse_event = event as InputEventMouseMotion
		self.position = get_global_mouse_position()

func run_watering_animation():
	state_machine.travel("water")


func _on_animation_tree_animation_finished(anim_name):
	state_machine.travel("idle")
