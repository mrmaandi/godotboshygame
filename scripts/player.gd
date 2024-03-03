extends CharacterBody2D

const SPEED = 300.0
const SLOWDOWN_SPEED = 100
const JUMP_VELOCITY = -700.0
const MAX_VELOCITY = -1000

@onready var sprite_2d = $AnimatedSprite2D
@onready var game_manager = %GameManager

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	if not game_manager.is_alive:
		return
	
	if (velocity.x > 1 || velocity.x < -1):
		sprite_2d.animation = "running"
	else:
		sprite_2d.animation = "default"
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y = clamp(velocity.y + gravity * delta, MAX_VELOCITY, -JUMP_VELOCITY)
		sprite_2d.animation = "jumping"

	# Handle jump.
	if Input.is_action_just_pressed("jump") and (is_on_floor() or game_manager.can_jump):
		velocity.y = JUMP_VELOCITY
		if not is_on_floor():
			game_manager.can_jump = false
			
	if Input.is_action_just_pressed('move_left'):
		sprite_2d.flip_h = true
	if Input.is_action_just_pressed('move_right'):
		sprite_2d.flip_h = false
	
	if is_on_floor() and game_manager.can_jump == false:
		game_manager.reset_jump()

	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SLOWDOWN_SPEED)

	move_and_slide()

func hit():
	game_manager.kill_player()
	sprite_2d.animation = "death"

func _on_animated_sprite_2d_animation_finished():
	match sprite_2d.animation:
		"death":
			sprite_2d.visible = false
		_:
			pass
