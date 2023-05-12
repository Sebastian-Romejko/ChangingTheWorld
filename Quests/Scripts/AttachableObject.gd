extends Sprite2D

func _on_area_2d_mouse_entered():
	get_parent().hovered_object = self


func _on_area_2d_mouse_exited():
	get_parent().hovered_object = null
