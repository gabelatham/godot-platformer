extends CanvasLayer

func _ready():
	$Coins/CoinIcon.playing = true

func update_coins(amount):
	$Coins.text = str(amount)

func show_win():
	$WinText.show()
