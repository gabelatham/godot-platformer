extends CanvasLayer

signal retry

func _ready():
	$Coins/CoinIcon.playing = true

func update_coins(amount):
	$Coins.text = str(amount)

func update_lives(amount):
	$Heart.frame = amount - 1

func show_win():
	$CenterText.text = "VICTORY"
	$CenterText.show()
	yield(get_tree().create_timer(1), "timeout")
	$ReplayLabel.show()
	emit_signal("retry")

func show_game_over():
	$CenterText.text = "GAME-OVER"
	$CenterText.show()
	yield(get_tree().create_timer(1), "timeout")
	$ReplayLabel.show()
	emit_signal("retry")
