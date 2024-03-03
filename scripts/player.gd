extends CharacterBody2D

const SPEED = 300.0
const SLOWDOWN_SPEED = 100
const JUMP_VELOCITY = -700.0

@onready var sprite_2d = $Sprite2D
@onready var game_manager = %GameManager

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	if (velocity.x > 1 || velocity.x < -1):
		sprite_2d.animation = "running"
	else:
		sprite_2d.animation = "default"
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		sprite_2d.animation = "jumping"

	# Handle jump.
	if Input.is_action_just_pressed("jump") and (is_on_floor() or game_manager.can_jump):
		velocity.y = JUMP_VELOCITY
		if not is_on_floor():
			game_manager.can_jump = false
	
	if is_on_floor() and game_manager.can_jump == false:
		game_manager.reset_jump()

	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SLOWDOWN_SPEED)

	move_and_slide()
	
	if Input.is_action_just_pressed('move_left'):
		sprite_2d.flip_h = true
	if Input.is_action_just_pressed('move_right'):
		sprite_2d.flip_h = false
