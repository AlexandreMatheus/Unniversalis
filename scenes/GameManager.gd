extends Node2D

export(String, FILE) var fish_scene = ''
export(String, FILE) var notification_scene = ''
var fish = true

func _ready():
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("INTERACT") and fish:
		fish = false
		$".".add_child(load(fish_scene).instance())
		print($".".get_children())
	
func delete_fish():
	$".".get_children().back().queue_free()

func show_notification():
	
	get_parent().get_children().back().add_child(load(notification_scene).instance())
