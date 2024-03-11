extends Node

var can_jump = true
var is_alive = true

var cam_x_index = 0
var cam_y_index = 0

@onready var player = %Player
@onready var main_camera = $"../MainCamera"
@onready var reset_ui = $"../MainCamera/ResetUI"
@onready var level_text = $"../MainCamera/LevelPanel/Text"

@onready var area_2d = $"../Tutorial/Screen3/Entities/AppleTrigger/Area2D"
@onready var spike_trigger_area_2d = $"../Tutorial/Screen2/Entities/SpikeTriggerArea2D"
@onready var hint_box = $"../MainCamera/HintBox"


func _ready():
	player.position = Global.respawn_point
	level_text.text = "Level: " + str(Global.level)
	prepare_level()

func reset_jump():
	can_jump = true

func _process(delta):
	if Input.is_action_just_pressed('reset'):
		reset_player()
		
func reset_player():
	get_tree().reload_current_scene()

func handle_player_death():
	is_alive = false
	reset_ui.visible = true
	
func go_to_next_level():
	get_tree().reload_current_scene()
	Global.level = Global.level + 1
	level_text.text = "Level: " + str(Global.level)
	
func prepare_level():
	match Global.level:
		2:
			area_2d.set_deferred("monitoring", true)
		3:
			area_2d.set_deferred("monitoring", true)
			spike_trigger_area_2d.set_deferred("monitoring", true)
		_:
			pass
