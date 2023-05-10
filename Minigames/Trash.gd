extends Node2D

func _on_ready():
	for child in find_children("Trash*"):
		child.set_meta("type", "trash")
