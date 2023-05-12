extends Node2D

@export var quest_id: int
@export var trash_stick: Node2D
@export var trash_to_collect: int

var collected_trash = 0
var is_trash_bin_hovered = false

func _input(event):
	if event is InputEventMouseButton:
		var mouse_event = event as InputEventMouseButton
		if mouse_event.button_index == MOUSE_BUTTON_LEFT && mouse_event.pressed:
			if is_trash_bin_hovered && trash_stick.attached_object != null:
				collected_trash += 1
				trash_stick.attached_object.free()
				if collected_trash == trash_to_collect:
					Quests.set_quest_done(quest_id)
					Global.goto_main_scene()
			else:
				trash_stick.handle_click()


func _on_trash_bin_mouse_entered():
	is_trash_bin_hovered = true


func _on_trash_bin_mouse_exited():
	is_trash_bin_hovered = false
