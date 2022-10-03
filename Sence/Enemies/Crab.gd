extends KinematicBody2D


var velocity = Vector2(0,0)
var is_moving_right = true
export var gravity = 10
export var speed = 50
onready var anim = $AnimationPlayer
onready var checkfloor = $FloorChecker
onready var shape = $CollisionShape2D
onready var hurtbox = $Top_checker
onready var delay = $Timer

func _ready():
	anim.play("walk")


func _process(_delta):
	
	move()
	turn_around()


func move():
	velocity.x = speed if is_moving_right else -speed
	velocity.y += gravity
	
	velocity = move_and_slide(velocity,Vector2.UP) 


func turn_around():
	if is_on_wall() or not checkfloor.is_colliding() and is_on_floor():
		is_moving_right = !is_moving_right
		scale.x = -scale.x



func _on_Top_checker_body_entered(_Player):
	anim.play("New Anim")
	delay.start()



func _on_Timer_timeout():
	queue_free()
