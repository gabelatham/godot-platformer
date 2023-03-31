extends Node2D

var coins = 0
var key = false

func _on_KillPlane_body_entered(_body):
	$Player.position.x = 30
	$Player.position.y = 200
	$Damage.play()
	


func _on_Coin_coin_collected():
	coins += 1
	$Player/Camera2D/HUD.update_coins(coins)
	$Collect.play()

func _on_Key_key_collected():
	key = true
	$Collect.play()
	$Flag.position.x = 2939
	$Flag.position.y = -1353
	$Flag.to_front()

func _on_Flag_flag_touched():
	if key:
		$Win.play()
		$Player/Camera2D/HUD.show_win()
