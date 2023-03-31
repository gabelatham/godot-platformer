extends Area2D

signal flag_touched

func to_front():
	z_index = 1
	$AnimatedSprite.playing = true

func _on_Flag_body_entered(_body):
	emit_signal("flag_touched")
