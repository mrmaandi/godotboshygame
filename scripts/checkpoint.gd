extends Node2D

@onready var sprite = $AnimatedSprite2D

@export var checkpoint_position: Vector2

func _ready():
	checkpoint_position = global_position

func _on_area_2d_area_entered(area):
	print("contact")
	if area.get_parent() is Player:
		sprite.animation = "active"
		Global.respawn_point = checkpoint_position
