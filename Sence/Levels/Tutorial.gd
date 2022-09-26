extends Node2D


onready var end_toturial = "res://Sence/Outer_game/YouWin.tscn"
func _ready():
	pass


func _on_Coin_collect():
	get_tree().change_scene(end_toturial)
