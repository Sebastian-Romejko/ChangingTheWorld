extends Sprite2D

@export var attachable_objects: Node2D 

var attached_object: Sprite2D

func _on_draw():
	pass
	
func _input(event):
			
				
	
	if event is InputEventMouseMotion:
		var mouse_event = event as InputEventMouseMotion
		self.position = get_global_mouse_position()
		if attached_object != null:
			attached_object.position = self.position

func handle_click():
	if attached_object == null && attachable_objects.hovered_object != null:
		attached_object = attachable_objects.hovered_object
	elif attached_object != null:
		attached_object = null
