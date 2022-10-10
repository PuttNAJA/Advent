extends Area2D

signal key_collect
onready var Anim = $AnimationPlayer
onready var Sound = $collect


func _on_AnimationPlayer_animation_finished(_anim_name):
	queue_free()


func _on_Key_body_entered(_body):
	Anim.play("disapier")
	Sound.play()
	emit_signal("key_collect")
	set_collision_mask_bit(0,false)
