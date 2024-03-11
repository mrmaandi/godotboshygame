extends Panel

@onready var label = $Label
@onready var description = $Description

func _ready():
	update()

func update():
	if Global.level == 1:
		self.visible = true
		
		print("hintbox update")
		print(Global.cam_x_index)
		
		match Global.cam_x_index:
			0:
				print("0")
				label.text = "Move and jump"
				description.text = "Move with WASD
									You can press W or Space to jump
									Press twice to perform a double-jump"
			1:
				print("1")
				label.set_deferred("text", "Jump replenisher")
				description.text = "On contact with this item will replenish your jump"
			2:
				print("2")
				label.text = "Checkpoints"
				description.text = "Touch the flag to save your progress"
			_:
				print("no!")
				pass
	else:
		self.visible = false		
