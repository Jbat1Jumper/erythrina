
extends Node2D

func _ready():
	pass

func spawn_food(type, x_offset):
	var food_scn = load("res://food.scn")
	var food = food_scn.instance()
	food.filter_food(type)
	food.set_pos(Vector2(x_offset, 0))
	add_child(food)
