
extends Node

var player
var last_h_axis = 0

func _ready():
	player = get_node("../player")
	set_process(true)
	
func _process(deltatime):
	var h_axis = get_h_axis()
	
	if last_h_axis != h_axis:
		move_player(h_axis)
		
	last_h_axis = h_axis

func get_h_axis():
	var h_axis = 0	
	if Input.is_action_pressed("player_left"):
		h_axis -= 1
	if Input.is_action_pressed("player_right"):
		h_axis += 1
	h_axis = get_touch_h_axis(h_axis)
	return h_axis
	
func get_touch_h_axis(h_axis):
	if Input.is_action_pressed("player_touch"):
		var px = (player.get_pos().x + player.get_width()/2)
		if get_world_mouse().x > px + 2:
			h_axis += 1
		elif get_world_mouse().x < px - 2:
			h_axis -= 1
	return h_axis

func get_world_mouse():
	var mp = Input.get_mouse_pos()  # the mouse position on the screen
	var vms = OS.get_video_mode_size()  # the size of the screen
	var ors = Vector2(196, 127)  # the size of the viewport
	return mp * (ors/vms)  # then we just scale it

func move_player(h_axis):
	if h_axis > 0:
		player.go_right()
	elif h_axis < 0:
		player.go_left()
	else:
		player.stop()
