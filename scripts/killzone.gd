extends Area2D

@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	print("You fell out of the world!")
	# Start delay to restart world
	timer.start()
	

func _on_timer_timeout() -> void:
	# Restarts world
	get_tree().reload_current_scene()
