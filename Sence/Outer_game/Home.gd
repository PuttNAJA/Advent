extends Control


var change
onready var sound = $Sound
onready var info = $Info
onready var go_to_level = "res://Sence/Levels/Level01.tscn"

func _ready():
	sound.play()
	info.visible = false


func _on_Play_pressed():
	change = get_tree().change_scene(go_to_level)


func _on_Quit_pressed():
	get_tree().quit()


func _on_AssetCreadit_pressed():
	info.visible = true


func _on_exit_pressed():
	info.visible = false
