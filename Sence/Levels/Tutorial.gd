extends Node2D


var change
onready var end_toturial = "res://Sence/Outer_game/YouWin.tscn"


func _on_Coin_collect():
	change = get_tree().change_scene(end_toturial)
