extends Node2D

var coins = 0
var lives = 3
var retry_available = false
var game_over = false
export var key = false

func _ready():
	$Player/Camera2D/HUD.update_lives(lives)
	if key:
		$Flag.to_front()

func _unhandled_input(event):
	if event.is_action_pressed("ui_accept") and retry_available:
		get_tree().reload_current_scene()

func _on_HUD_retry():
	retry_available = true

func _on_KillPlane_body_entered(_body):
	$Player.position.x = 30
	$Player.position.y = 200
	damage()

func _on_Key_key_collected():
	key = true
	$Flag.to_front()
	$MissingKey.hide()

func _on_Flag_flag_touched():
	if key and not game_over:
		$Player/Camera2D/HUD.show_win()
		$Win.play()
		game_over = true

func coin():
	coins += 1
	$Player/Camera2D/HUD.update_coins(coins)

func damage():
	if not game_over:
		lives -= 1
		$Player/Camera2D/HUD.update_lives(lives)
		$Damage.play()
	if lives <= 0 and not game_over:
		$Player/Camera2D/HUD.show_game_over()
		game_over = true

func _on_Enemy3_damage():
	damage()

func _on_Enemy4_damage():
	damage()

func _on_Coin_coin_collected():
	coin()

func _on_Coin2_coin_collected():
	coin()

func _on_Coin3_coin_collected():
	coin()

func _on_Coin4_coin_collected():
	coin()

func _on_Coin5_coin_collected():
	coin()
	
func _on_Coin6_coin_collected():
	coin()
