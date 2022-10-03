extends Control


onready var restart = "res://Sence/Levels/Level01.tscn"
onready var menu = "res://Sence/Outer_game/Home.tscn"
var change

func _ready():
	pass


func _on_Quit_pressed():
	change = get_tree().change_scene(menu)


func _on_Playagain_pressed():
	Globle.lives = Globle.max_lives
	change = get_tree().change_scene(restart)
	return

