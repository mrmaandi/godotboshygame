extends Area2D

@onready var sprite = $AnimatedSprite2D

@export var checkpoint_position: Vector2

func _ready():
	checkpoint_position = global_position

func _on_body_entered(body):
	if (body.name == "Player"):
		sprite.animation = "active"
		Global.respawn_point = checkpoint_position

