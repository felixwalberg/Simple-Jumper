extends Area2D

# Trigger signal when body enters
func _on_body_entered(body: Node2D) -> void:
	print("now I have speeeeeed!")
	# Activate speed effect
	body._speed_potion()
	# Now remove the potion 
	queue_free()
	
