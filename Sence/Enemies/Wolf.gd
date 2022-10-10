extends KinematicBody2D

var motion = Vector2()
var die = false
export var gravity = 20
export var speed = 90
export var direction = -1
export var detect_cliffs = true
onready var collition = $CollisionShape2D
onready var anim = $AnimatedSprite
onready var check = $FloorChecker
onready var side = $Position2D


func _ready():
	if direction == 1:
		anim.flip_h = true
	check.position.x = collition.shape.get_extents().x * direction
	check.enabled = detect_cliffs


func _physics_process(_delta):
	if die == false:
		if is_on_wall() or not check.is_colliding() and detect_cliffs and is_on_floor():
			direction = direction * -1
			anim.flip_h = not anim.flip_h
			check.position.x = collition.shape.get_extents().x * direction
			side.scale.x = -side.scale.x
	
		motion.y += gravity
		motion.x = speed * direction
		motion = move_and_slide(motion , Vector2.UP)



func take_damage(_amount: int):
	anim.play("dead")
	speed = 0


func _on_AnimatedSprite_animation_finished():
	if anim.animation == "dead":
		queue_free()
