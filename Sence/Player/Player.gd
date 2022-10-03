extends KinematicBody2D


var motion = Vector2(0,0)
var up = Vector2(0,-1)
var countjump = 0

onready var win = "res://Sence/Outer_game/YouWin.tscn"
onready var animation_tree = $AnimationTree
onready var state_machine = animation_tree.get("parameters/playback")
onready var side = $Body
onready var hurtCD = $cooldown
onready var jump = $Jump_sound
export var Speed = 150
export var JumpSpeed = 200
export var Gravity = 100


func _physics_process(_delta):
	add_action()
	motion = move_and_slide(motion,up)
	add_gravity()
	


func add_gravity():
	if is_on_floor():
		motion.y = 0
		countjump = 0
	else:
		motion.y += Gravity


func add_action():
	if Input.is_action_just_pressed("up") && countjump < 2:
		motion.y = -JumpSpeed
		countjump += 1
		state_machine.travel("Jump")
		jump.play()
		
	elif Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		motion.x = -Speed
		state_machine.travel("Run")
		side.scale.x = -1
		
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		motion.x = Speed
		state_machine.travel("Run")
		side.scale.x = 1
		
	elif Input.is_action_just_pressed("attack"):
		state_machine.travel("Attack")
		
	else:
		motion.x = 0
		state_machine.travel("Idle")

func damaged():
	set_modulate(Color(1,0.3,0.3,0.3))
	Globle.lose_life()
	hurtCD.start()


func _on_cooldown_timeout():
	set_modulate(Color(1,1,1,1))


func _on_Hurt_box_body_entered(_body):
	damaged()
