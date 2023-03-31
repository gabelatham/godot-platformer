extends Area2D

signal flag_touched

func to_front():
	z_index = 1
	position.x = 2939
	position.y = -1353
	$AnimatedSprite.playing = true

func _on_Flag_body_entered(_body):
	emit_signal("flag_touched")
