
extends Node2D

var speed = 50.0
var exploded = false

func _ready():
	set_process(true)
	
func filter_food(name):
	var foods = get_child("kind").get_children()
	for food in foods:
		if food.get_name() != name:
			get_child("kind").remove_child(food)
	
func _process(deltatime):
	var pos = get_pos()
	pos.y += speed * deltatime
	set_pos(pos)
	
func get_score():
	var kind = get_child("kind").get_children()[0].get_name()
	if kind == "pizza":
		return 10
	elif kind == "icecream":
		return 15
	elif kind == "hamburger":
		return 25
	elif kind == "fries":
		return 5
	return 0
	
func can_eat():
	return not exploded
	
func explode():
	exploded = true
	get_node("explosion/anim").play("boom")
	get_node("kind").hide()