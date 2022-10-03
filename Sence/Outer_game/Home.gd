extends Control


onready var sound = $Sound
onready var go_to_level = "res://Sence/Levels/Level01.tscn"

func _ready():
	sound.play()


func _on_Play_pressed():
	get_tree().change_scene(go_to_level)


func _on_Quit_pressed():
	get_tree().quit()
