extends Area2D

signal coin_collected

func _ready():
	$AnimatedSprite.playing = true
	

func _on_Coin_body_entered(_body):
	emit_signal("coin_collected")
	set_collision_mask_bit(3, false)
	var desired = 0
	var rate = 0.5
	while(scale.x > desired):
		scale.x = move_toward(scale.x, desired, rate)
		scale.y = move_toward(scale.y, desired, rate)
		yield(get_tree().create_timer(0.025), "timeout")
	queue_free()
