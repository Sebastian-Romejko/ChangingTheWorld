extends Node2D

@onready var attachable_items = $Items

@export var quest_id: int

var attached_object: Node2D
var is_area_for_building_hovered = false

var is_plank_placed = false
var placed_nails = 0

func _on_ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _input(event):
	if event is InputEventMouseButton:
		var mouse_event_button = event as InputEventMouseButton
		if mouse_event_button.button_index == MOUSE_BUTTON_LEFT && mouse_event_button.pressed:
			if is_area_for_building_hovered && attached_object != null:
				if is_plank_placed && attached_object.name.contains("Nail"):
					attached_object.queue_free()
					attached_object = null
					placed_nails += 1
				elif !is_plank_placed && attached_object.name.contains("WoodenPlank"):
					attached_object.position = Vector2(8, 0)
					attached_object = null
					is_plank_placed = true
					
				if is_plank_placed && placed_nails == 4:
					Quests.set_quest_done(quest_id)
					Global.goto_main_scene()
			else:
				if attached_object == null && attachable_items.hovered_object != null:
					if (!is_plank_placed && attachable_items.hovered_object.name.contains("WoodenPlank")) || !attachable_items.hovered_object.name.contains("WoodenPlank"):
						attached_object = attachable_items.hovered_object
				elif attached_object != null:
					attached_object = null

	if event is InputEventMouseMotion && attached_object != null:
		attached_object.position = get_global_mouse_position()

func _on_area_for_building_mouse_entered():
	is_area_for_building_hovered = true


func _on_area_for_building_mouse_exited():
	is_area_for_building_hovered = false
