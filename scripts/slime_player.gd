extends CharacterBody2D

@onready var speed_potion_duration: Timer = $"Speed Potion Duration"

var SPEED = 130.0
const JUMP_VELOCITY = -300.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _speed_potion():
	speed_potion_duration.start()
	SPEED = 250
	
func _on_timer_timeout() -> void:
	SPEED = 130
	print("No more speed")


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get input direction: -1 (left), 0 (idle), or 1 (right)
	var direction := Input.get_axis("move_left", "move_right")
	
	# Flip sprite according to direction
	if direction > 0: 
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true	
		
	# Play animations
	if direction == 0:
		animated_sprite.play("idle")
	else:
		animated_sprite.play("running")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
