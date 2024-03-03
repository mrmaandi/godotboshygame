extends Area2D

@export var target_level : PackedScene

func _on_body_entered(body):
	if body.name == "Player":
		print("hello")
		print(target_level.resource_name)
		get_tree().change_scene_to_file(target_level.resource_name)
