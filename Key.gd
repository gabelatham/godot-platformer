extends Area2D

signal key_collected

func _on_Key_body_entered(_body):
	emit_signal("key_collected")
	$Collect.play()
	set_collision_mask_bit(3, false)
	var desired = 0
	var rate = 0.5
	while(scale.x > desired):
		scale.x = move_toward(scale.x, desired, rate)
		scale.y = move_toward(scale.y, desired, rate)
		yield(get_tree().create_timer(0.025), "timeout")
	queue_free()
