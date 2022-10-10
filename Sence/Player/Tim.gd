extends KinematicBody2D

var velocity = Vector2(0,0)
var up = Vector2(0,-1)
var isAttacking = false
var countjump = 0
export var Speed = 180
export var Gravity = 35
export var JumpForce = -500
onready var side = $Position2D
onready var anim = $AnimatedSprite
onready var AttackZone = $Position2D/MyHitBox/CollisionShape2D


func _process(_delta):
	
	add_gravity()
	
	if Input.is_action_pressed("right") && isAttacking == false:
		velocity.x = Speed
		anim.play("Run")
		anim.flip_h = false
		side.scale.x = 1
	
	elif Input.is_action_pressed("left") && isAttacking == false:
		velocity.x = -Speed
		anim.play("Run")
		anim.flip_h = true
		side.scale.x = -1
	
	else:
		velocity.x = 0
		if isAttacking == false:
			anim.play("Idle")
	
	if not is_on_floor():
		anim.play("Air")
	
	
	if Input.is_action_just_pressed("up") && countjump < 2:
		velocity.y = JumpForce
		countjump += 1
	
	
	if Input.is_action_just_pressed("attack"):
		anim.play("Attack01") 
		isAttacking = true
		AttackZone.disabled = false
	
	velocity = move_and_slide(velocity , up)


func add_gravity():
	if is_on_floor():
		velocity.y = 0
		countjump = 0
	else:
		velocity.y = velocity.y + Gravity


func _on_AnimatedSprite_animation_finished():
	if anim.animation == "Attack01":
		isAttacking = false
		AttackZone.disabled = true
	
	if anim.animation == "Hurt" :
		isAttacking = false


func take_damage(_amount: int):
	isAttacking = true
	print("ouch!")
	anim.play("Hurt")
	Globle.lose_life()
