
extends AnimatedSprite

export var speed = 2.0

func _ready():
	set_process(true)
	

func _process(deltatime):
	var pos = get_pos()
	pos.x += speed * deltatime
	set_pos(pos)


