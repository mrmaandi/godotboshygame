extends Camera2D

var screen_width = 1024
var screen_height = 576

@onready var player = %Player
@onready var hint_box = $HintBox


func _process(delta):
	var current_cam_x_index = floor(player.position.x / screen_width)
	var current_cam_y_index = floor(player.position.y / screen_height)
	
	if (Global.cam_x_index != current_cam_x_index || Global.cam_y_index != current_cam_y_index):
		print("switch cam pos")
		Global.cam_x_index = current_cam_x_index
		Global.cam_y_index = current_cam_y_index
		self.position = Vector2(
			Global.cam_x_index * screen_width,
			Global.cam_y_index * screen_height
		)
		hint_box.update()
