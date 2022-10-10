class_name MyHurtBox
extends Area2D

var merge


func _init():
	collision_layer = 0
	collision_mask = 32


func _ready():
	merge = connect("area_entered",self,"_on_area_entered")


func _on_area_entered(hitbox : MyHitBox):
	if hitbox == null:
		return
	
	if owner.has_method("take_damage"):
		owner.take_damage(hitbox.damage)

