extends Node

var can_jump = true
var is_alive = true

@onready var player = %Player
@onready var main_camera = $"../MainCamera"
@onready var reset_ui = $"../MainCamera/ResetUI"

var screen_width = 1024
var screen_height = 576

var current_cam_x_index = 0
var current_cam_y_index = 0

func _ready():
	player.position = Global.respawn_point

func reset_jump():
	can_jump = true

func _process(delta):
	var cam_x_index = screen_width * floor(player.position.x / screen_width)
	var cam_y_index = screen_height * floor(player.position.y / screen_height)
	
	if Input.is_action_just_pressed('reset'):
		reset_player()
	
	if (current_cam_x_index != cam_x_index || current_cam_y_index != cam_y_index):
		print("switch cam pos")
		current_cam_x_index = cam_x_index
		current_cam_y_index = cam_y_index
		
		main_camera.position = Vector2(
			current_cam_x_index,
			current_cam_y_index
		)
		
func reset_player():
	get_tree().reload_current_scene()

func kill_player():
	is_alive = false
	reset_ui.visible = true
