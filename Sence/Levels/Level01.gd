extends Node2D

var change
var coin = 0
onready var music = $Background_sound
onready var over = "res://Sence/Outer_game/Gameover.tscn"
onready var win = "res://Sence/Outer_game/YouWin.tscn"

func _ready():
	music.play()

func _physics_process(delta):
	if coin == 5:
		change = get_tree().change_scene(win)

func _on_Area2D_body_entered(_Player):
	change = get_tree().change_scene(over)


func _on_coin_collect():
	coin = coin + 1
