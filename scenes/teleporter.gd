extends Node2D

@onready var game_manager = %GameManager
@onready var audio_stream_player = $AudioStreamPlayer

@export var target_teleporter: Node2D

func _on_area_2d_area_entered(area):
	if area.get_parent() is Player:
		#teleport player to next level
		if target_teleporter:
			audio_stream_player.play()
			await audio_stream_player.finished
			
			area.get_parent().position = target_teleporter.position
			Global.respawn_point = target_teleporter.position
			game_manager.go_to_next_level()
			print("telported")
