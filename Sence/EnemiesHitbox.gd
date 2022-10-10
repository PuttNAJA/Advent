class_name EnemiesHitbox
extends Area2D

export var damage = 10

func _init():
	collision_layer = 64
	collision_mask = 0
