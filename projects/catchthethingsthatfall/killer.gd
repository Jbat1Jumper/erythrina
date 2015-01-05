
extends Area2D

func _ready():
	set_process(true)

func _process(deltatime):
	var things = get_overlapping_bodies()
	for thing in things:
		thing.queue_free()  # KILL
	