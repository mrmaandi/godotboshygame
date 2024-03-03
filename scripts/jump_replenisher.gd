extends Area2D

@onready var game_manager = %GameManager

func _on_body_entered(body):
	if (body.name == "Player" and 	$CollisionShape2D.disabled == false):
		$Sprite2D.visible = false
		$CollisionShape2D.disabled = true

		#queue_free()
		game_manager.reset_jump()
		$Timer.start()

func _on_timer_timeout():
	$Sprite2D.visible = true
	$CollisionShape2D.disabled = false
