extends Node2D

@onready var game_manager = %GameManager

@export var target_teleporter: Node2D

func _on_area_2d_area_entered(area):
	if area.get_parent() is Player:
		#teleport player to next level
		if target_teleporter:
			area.get_parent().position = target_teleporter.position
			Global.respawn_point = target_teleporter.position
			game_manager.go_to_next_level()
			print("telported")
