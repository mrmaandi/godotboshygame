extends CharacterBody2D

@export var move_dir: Vector2
@export var speed: float

var is_moving = false

func _physics_process(delta):
	if is_moving:
		var collision = move_and_collide(move_dir * delta * speed)
		if collision:
			var collider = collision.get_collider()
			if collider is TileMap:
				print("collide with TileMap")
				queue_free()


func notify():
	is_moving = true

func _on_area_2d_body_entered(body):
	if body is TileMap:
		# could play explode animation here
		queue_free()
