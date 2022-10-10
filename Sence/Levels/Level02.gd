extends Node2D

var change
var coin = 0
var key = 0
onready var music = $Background_sound
onready var doorclose = $Doorclose
onready var dooropen = $Dooropen
onready var door = $Doorclose/CollisionShape2D
onready var over = "res://Sence/Outer_game/Gameover.tscn"
onready var win = "res://Sence/Outer_game/YouWin.tscn"

func _ready():
	music.play()

func _physics_process(_delta):
	if key == 1:
		doorclose.visible = false
		door.disabled = true



func _on_Fallzone_body_entered(_body):
	change = get_tree().change_scene(over)



func _on_Dooropen_body_entered(_body):
	change = get_tree().change_scene(win)


func _on_Key_key_collect():
	key = key + 1
