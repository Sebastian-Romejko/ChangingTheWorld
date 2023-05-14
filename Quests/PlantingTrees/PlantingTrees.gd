extends Node2D

@onready var trees = $Trees
@onready var tree_1 = $Trees/Tree1
@onready var tree_2 = $Trees/Tree2 

@export var quest_id: int
@export var trees_to_plant: int

var planted_trees = 0
var difference_on_x = 8
var difference_on_y = -16

var is_any_tree_hovered = false

func _on_ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
func _input(event):
	if event is InputEventMouseButton:
			var mouse_event_button = event as InputEventMouseButton
			if mouse_event_button.button_index == MOUSE_BUTTON_LEFT && mouse_event_button.pressed && !is_any_tree_hovered:
				var tree_to_plant: Node2D
				if randi_range(1,2) == 1:
					tree_to_plant = tree_1.duplicate()
				else:
					tree_to_plant = tree_2.duplicate()
				trees.add_child(tree_to_plant)
				tree_to_plant.visible = true
				tree_to_plant.position = get_global_mouse_position() + Vector2(difference_on_x, difference_on_y)
				planted_trees += 1
				if planted_trees == trees_to_plant:
					Quests.set_quest_done(quest_id)
					Global.goto_main_scene()



func _on_tree_1_area_mouse_entered():
	is_any_tree_hovered = true


func _on_tree_1_area_mouse_exited():
	is_any_tree_hovered = false


func _on_tree_2_area_mouse_entered():
	is_any_tree_hovered = true


func _on_tree_2_area_mouse_exited():
	is_any_tree_hovered = false
