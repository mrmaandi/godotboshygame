extends Area2D


@onready var apple = $"../Apple2"


func _on_body_entered(body):
	if (body.name == "Player"):
		apple.notify()
