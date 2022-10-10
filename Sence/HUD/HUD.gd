extends CanvasLayer


var coin = 0
var key = 0
onready var numcoin = $Coin/CoinNum
onready var numkey = $Key/KeyNum


func _ready():
	numcoin.text = String(coin)
	numkey.text  = String(key)


func _on_Coin_collect():
	coin = coin + 1
	_ready()


func _on_Key_collect():
	key = key + 1
	_ready()
