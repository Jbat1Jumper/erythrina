
extends Node2D

var speed = 50.0

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
	