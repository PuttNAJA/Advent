extends Node2D

var change
var coin = 0
onready var music = $Background_sound
onready var doorclose = $Doorclose
onready var dooropen = $Dooropen
onready var door = $Doorclose/CollisionShape2D
onready var over = "res://Sence/Outer_game/Gameover.tscn"
onready var nextLv = "res://Sence/Levels/Level02.tscn"

func _ready():
	music.play()

func _physics_process(_delta):
	if coin == 5:
		doorclose.visible = false
		door.disabled = true

func _on_Area2D_body_entered(_Player):
	change = get_tree().change_scene(over)


func _on_coin_collect():
	coin = coin + 1


func _on_Dooropen_body_entered(_body):
	change = get_tree().change_scene(nextLv)
