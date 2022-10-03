extends CenterContainer

var change
onready var movetween = $Tween
onready var audio = $Sound
onready var menu = "res://Sence/Outer_game/Home.tscn"

func go_down():
	movetween.interpolate_property(self, "rect_position:y", -400, 56, 1, Tween.TRANS_ELASTIC, Tween.EASE_OUT)
	movetween.start()
	audio.play()


func _on_Resume_pressed():
	movetween.interpolate_property(self, "rect_position:y", 56, -400, 0.5, Tween.EASE_OUT)
	movetween.start()

func _on_Setting_pressed():
	go_down()


func _on_Setting_button_pressed():
	go_down()



func _on_Main_menu_pressed():
	change = get_tree().change_scene(menu)
