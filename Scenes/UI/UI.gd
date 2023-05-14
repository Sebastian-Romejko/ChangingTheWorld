extends Control

@onready var coin_label = $PanelCoins/Label
@onready var heart_label = $PanelHearts/Label2
@onready var time_label = $PanelTime/Label

@onready var coin_panel = $PanelCoins
@onready var heart_panel = $PanelHearts
@export var show_only_time = false

func _on_ready():
	if show_only_time:
		coin_panel.visible = false
		heart_panel.visible = false
	
func _physics_process(delta):
	if Global.time_left > 0:
		time_label.text = "%02d:%02d" % [fmod(Global.time_left, 60*60) / 60, fmod(Global.time_left, 60)]

func refresh():
	coin_label.text = str(Global.coin_counter)
	heart_label.text = str(Global.heart_counter)
