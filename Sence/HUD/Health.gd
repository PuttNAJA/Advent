extends CanvasLayer


onready var Heart = $HeartFull
onready var EmtHeart = $HeartEmpty


func _ready():
	load_heart()
	Globle.hud = self


func load_heart():
	Heart.rect_size.x = Globle.lives * 21
	EmtHeart.rect_size.x = (Globle.max_lives - Globle.lives) * 21
	EmtHeart.rect_position.x = Heart.rect_position.x + Heart.rect_size.x * Heart.rect_scale.x
