extends CanvasLayer


var coin = 0
onready var number = $CoinNum


func _ready():
	number.text = String(coin)


func _on_Coin_collect():
	coin = coin + 1
	_ready()
