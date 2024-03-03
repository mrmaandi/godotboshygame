extends Area2D

@export var move_dir: Vector2
@export var speed: float = 300.0

var is_moving = false

var start_pos: Vector2
var target_pos: Vector2

func _ready():
	start_pos = global_position
	target_pos = start_pos + move_dir

func _process(delta):
	if is_moving:
		print("move toward")
		global_position = global_position.move_toward(target_pos, speed * delta)

func _on_body_entered(body):
	if (body.name == "Player"):
		body.hit()

func notify():
	is_moving = true
