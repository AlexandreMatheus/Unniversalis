extends Node2D

export(String, FILE) var fish_scene = ''
export(String, FILE) var notification_scene = ''
var fish = true
onready var timer: Timer = get_parent().get_node("Timer")
onready var dialog = get_parent().get_node("CanvasLayer/DialogueBox")
onready var desconhecidos = get_parent().get_node("CatsSpy/AnimationPlayer")

func _ready():
	timer.start(0.5)
	yield(timer, "timeout")
	dialog.start(ListDialog.get_first_dialog_planet())
	desconhecidos.play("FadeInCats")
	dialog.connect("dialogue_ended", self, "remove_cats")
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("INTERACT") and fish:
		fish = false
		$'.'.add_child(load(fish_scene).instance())

func delete_fish():
	$".".get_children().back().queue_free()

func show_notification():
	get_parent().get_node("CanvasLayer").add_child(load(notification_scene).instance())

func remove_cats():
	desconhecidos.play("FadeOutCats")
