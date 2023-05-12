extends Control

@export var coin_label = Label
@export var heart_label = Label
@export var time_label = Label

func _physics_process(delta):
	if Global.time_left > 0:
		time_label.text = "%02d:%02d" % [fmod(Global.time_left, 60*60) / 60, fmod(Global.time_left, 60)]

func refresh():
	coin_label.text = str(Global.coin_counter)
	heart_label.text = str(Global.heart_counter)
