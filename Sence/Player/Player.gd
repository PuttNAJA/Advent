extends KinematicBody2D

var motion = Vector2(0,0)
var up = Vector2(0,-1)
var countjump = 0
onready var movement = $Anim_Player
onready var hurtCD = $cooldown
export var Speed = 150
export var JumpSpeed = 200
export var Gravity = 100


func _physics_process(_delta):
	move()
	jump()
	motion = move_and_slide(motion,up)
	add_gravity()
	animation()


func add_gravity():
	if is_on_floor():
		motion.y = 0
		countjump = 0
	else:
		motion.y += Gravity


func move():
	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		motion.x = -Speed
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		motion.x = Speed
	else:
		motion.x = 0


func jump():
	if Input.is_action_just_pressed("up") && countjump < 2:
		motion.y = -JumpSpeed
		countjump += 1


func animation():
	if motion.x > 0 :
		movement.play("Walk")
		movement.flip_h = false
	elif motion.x < 0 :
		movement.play("Walk")
		movement.flip_h = true
	elif motion.y != 0:
		movement.play("Jump")
	else:
		movement.play("Idle")


func damaged(var enemyposx):
	Globle.lose_life()
	set_modulate(Color(1,0.3,0.3,0.3))
	motion.y = JumpSpeed * 0.5
	
	if position.x < enemyposx:
		motion.x = -50
	elif position.x > enemyposx:
		motion.x = 50
	#can't move when damaged
	#Input.action_release("left")
	#Input.action_release("right")
	
	hurtCD.start()
	
	

func _on_cooldown_timeout():
	set_modulate(Color(1,1,1,1))
