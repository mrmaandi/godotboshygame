extends Node

var can_jump = true

func reset_jump():
	can_jump = true

@onready var player = %Player
@onready var main_camera = $"../MainCamera"

var screen_width = 1024
var screen_height = 576

var current_cam_x_index = 0
var current_cam_y_index = 0


func _process(delta):
	var cam_x_index = screen_width * floor(player.position.x / screen_width)
	var cam_y_index = screen_height * floor(player.position.y / screen_height)
	
	if (current_cam_x_index != cam_x_index || current_cam_y_index != cam_y_index):
		print("switch cam pos")
		current_cam_x_index = cam_x_index
		current_cam_y_index = cam_y_index
		
		main_camera.position = Vector2(
			current_cam_x_index,
			current_cam_y_index
		)
