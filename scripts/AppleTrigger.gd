extends Node

@onready var apple = $"../Apple"



func _on_area_2d_area_entered(area):
	if apple != null and area.get_parent() is Player:
		apple.notify()
