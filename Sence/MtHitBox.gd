class_name MyHitBox
extends Area2D

export var damage = 10

func _init():
	collision_layer = 32
	collision_mask = 0
