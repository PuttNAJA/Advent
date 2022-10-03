extends KinematicBody2D


var velocity = Vector2(0,0)
var is_moving_left = true
export var gravity = 10
export var speed = 80
onready var anim = $AnimationSlime
onready var checkfloor = $FloorChecker
onready var attackdetector = $AttackBox
onready var cooldown = $Timer
onready var shape = $Body

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
	if is_on_wall() or not checkfloor.is_colliding() and is_on_floor():
		is_moving_left = !is_moving_left
		scale.x = -scale.x


func attack():
	attackdetector.monitoring = true


func end_attack():
	attackdetector.monitoring = false


func start_walk():
	anim.play("Move")


func _on_PlayerDetector_body_entered(_Player):
	anim.play("Attack")


func _on_AttackBox_body_entered(Player):
	Player.damaged()


func _on_hitbox_body_entered(_Player):
	anim.play("Die")
	cooldown.start()
	velocity.x = 0
	velocity.y = 0


func _on_Timer_timeout():
	queue_free()
