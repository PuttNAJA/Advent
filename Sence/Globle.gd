extends Node


var max_lives = 5
var lives = max_lives
var hud
var change
onready var over = "res://Sence/Outer_game/Gameover.tscn"


func lose_life():
	lives -= 1
	hud.load_heart()
	if lives <= 0:
		change = get_tree().change_scene(over)
