extends Node2D

@onready var sprite = $AnimatedSprite2D
@onready var audio_stream_player = $AudioStreamPlayer

#@export var activated = false
@export var checkpoint_position: Vector2

func _ready():
	checkpoint_position = global_position

func _on_area_2d_area_entered(area):
	if area.get_parent() is Player:
		#activated = true
		sprite.animation = "active"
		audio_stream_player.play()
		Global.respawn_point = checkpoint_position
