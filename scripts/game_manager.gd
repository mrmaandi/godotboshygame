extends Node

var can_jump = true
var is_alive = true

@onready var player = %Player
@onready var main_camera = $"../MainCamera"
@onready var reset_ui = $"../MainCamera/ResetUI"
@onready var text = $"../MainCamera/LevelPanel/Text"

@onready var area_2d = $"../Tutorial/Screen3/Entities/AppleTrigger/Area2D"


var screen_width = 1024
var screen_height = 576

var current_cam_x = 0
var current_cam_y = 0

func _ready():
	player.position = Global.respawn_point
	text.text = "Level: " + str(Global.level)
	prepare_level()

func reset_jump():
	can_jump = true

func _process(delta):
	var current_cam_x_index = floor(player.position.x / screen_width)
	var current_cam_y_index = floor(player.position.y / screen_height)
	var cam_x = screen_width * current_cam_x_index
	var cam_y = screen_height * current_cam_y_index
	
	if Input.is_action_just_pressed('reset'):
		reset_player()
	
	if (current_cam_x != cam_x || current_cam_y != cam_y):
		print("switch cam pos")
		current_cam_x = cam_x
		current_cam_y = cam_y
		
		main_camera.position = Vector2(current_cam_x, current_cam_y)
		
func reset_player():
	get_tree().reload_current_scene()

func handle_player_death():
	is_alive = false
	reset_ui.visible = true
	
func go_to_next_level():
	get_tree().reload_current_scene()
	Global.level = Global.level + 1
	text.text = "Level: " + str(Global.level)
	
func prepare_level():
	match Global.level:
		2:
			print("2")
			area_2d.set_deferred("monitoring", true)
		_:
			pass
