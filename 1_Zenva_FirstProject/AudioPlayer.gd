extends AudioStreamPlayer2D

var coinSFX = preload("res://Audio/coin.ogg")

func play_coin_sfx():
	stream = coinSFX
	play()
