extends CharacterBody2D

@onready var player = %Player

@export var is_attacking = false


func _physics_process(delta):
	if is_attacking:
		var direction: Vector2 = (player.position - self.global_position).normalized()
		move_and_collide(direction * delta * 100)
		
		var angle = direction.angle_to_point(Vector2.UP)
		self.rotation = angle

func _on_area_2d_area_entered(area):
	if area.get_parent() is Player:
		area.get_parent().hit()
