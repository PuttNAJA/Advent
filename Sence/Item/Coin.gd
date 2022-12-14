extends Area2D


signal coin_collect
onready var Anim = $Disappear
onready var Sound = $collect


func _on_Disappear_animation_finished(_anim_name):
	queue_free()


func _on_Coin_body_entered(_body):
	Anim.play("Gone")
	Sound.play()
	emit_signal("coin_collect")
	set_collision_mask_bit(0,false)
