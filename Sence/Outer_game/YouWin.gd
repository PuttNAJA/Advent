extends Control


onready var restart = "res://Sence/Levels/Tutorial.tscn"

func _ready():
	pass


func _on_Quit_pressed():
	get_tree().quit()


func _on_Playagain_pressed():
	Globle.lives = Globle.max_lives
	get_tree().change_scene(restart)
