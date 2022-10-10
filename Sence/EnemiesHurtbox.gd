class_name EnemiesHurtBox
extends Area2D

var merge


func _init():
	collision_layer = 0
	collision_mask = 64


func _ready():
	merge = connect("area_entered",self,"_on_area_entered")


func _on_area_entered(hitbox : EnemiesHitbox):
	if hitbox == null:
		return
	
	if owner.has_method("take_damage"):
		owner.take_damage(hitbox.damage)
