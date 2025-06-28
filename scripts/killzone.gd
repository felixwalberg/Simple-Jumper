extends Area2D

@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	print("You lost!")
	# Slow everything down during "death"
	Engine.time_scale = 0.5
	# Remove collisions from the player so they fall through the world
	body.get_node("CollisionShape2D").queue_free()
	# Start delay to restart world
	timer.start()
	

func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
	# Restarts world
	get_tree().reload_current_scene()
