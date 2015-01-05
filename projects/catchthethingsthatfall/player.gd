
extends AnimatedSprite

var FoodType = preload("food.gd")


export var speed = 2.0

var heading_direction = 0.0
var anim
var body
var score = 0

func _ready():
	body = get_node("./body")
	anim = get_node("./anim")
	set_process(true)

func _process(deltatime):
	var pos = get_pos()
	pos.x += speed * deltatime * heading_direction
	pos = bound_pos(pos)
	set_pos(pos)
	
	var things = body.get_overlapping_bodies()
	if things.size() != 0:
		for thing in things:
			if FoodType.instance_has(thing):
				eat_food(thing)

func eat_food(food):
	if food.can_eat():
		score += food.get_score()
		food.explode()
		
			
func bound_pos(pos):
	if pos.x > 152:
		pos.x = 152
	if pos.x < 28:
		pos.x = 28
	return pos
	


# Our Character Controller API
func go_left():
	set_flip_h(true)
	if anim.has_animation("walk"):
		anim.play("walk")
	heading_direction = -1.0

func go_right():
	set_flip_h(false)
	if anim.has_animation("walk"):
		anim.play("walk")
	heading_direction = 1.0

func stop():
	if anim.has_animation("idle"):
		anim.play("idle")
	heading_direction = 0.0

	
# A little help
func get_width():
	return get_sprite_frames().get_frame(get_frame()).get_width()
	
	