extends KinematicBody2D


var velocity = Vector2(0,0)
var is_moving_left = true
export var gravity = 10
export var speed = 80
onready var anim = $AnimationSlime
onready var checkfloor = $FloorChecker
onready var attackdetector = $AttackBox

func _ready():
	anim.play("Move")


func _process(_delta):
	
	if anim.current_animation == "Attack":
		return
	
	move()
	turn_around()


func move():
	velocity.x = -speed if is_moving_left else speed
	velocity.y += gravity
	
	velocity = move_and_slide(velocity,Vector2.UP) 


func turn_around():
	if not checkfloor.is_colliding() and is_on_floor():
		is_moving_left = !is_moving_left
		scale.x = -scale.x


func attack():
	attackdetector.monitoring = true


func end_attack():
	attackdetector.monitoring = false


func start_walk():
	anim.play("Move")


func _on_PlayerDetector_body_entered(_body):
	anim.play("Attack")



func _on_AttackBox_body_entered(body):
	body.damaged(position.x)
