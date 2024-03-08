extends Area2D

@onready var spike = $"../Spike"

func _on_area_entered(area):
	if area.get_parent() is Player:
		spike.is_attacking = true
