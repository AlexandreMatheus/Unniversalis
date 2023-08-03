extends KinematicBody2D

const gravity = -11
const FLAP = 100
const MAXFALLSPEED = -5

var motion = Vector2()
var UP = Vector2(-1, 0)
var fish_inside = false
var percent_complete = 0

signal update_progress(value)

func _ready():
	pass

func _process(delta):
	motion.x += gravity
	if motion.x < gravity:
		motion.x = gravity
	
	if Input.is_action_just_pressed("INTERACT"):
		motion.x = FLAP

	motion = move_and_slide(motion, UP)
	update_percent_complete()

func update_percent_complete():
	if (fish_inside):
		percent_complete += 0.2
		if (percent_complete >= 100):
			percent_complete = 100
			get_parent().get_parent().show_notification()
			get_parent().queue_free()
	else:
		percent_complete -= 0.1
		if (percent_complete < 0):
			percent_complete = 0
	emit_signal("update_progress", percent_complete)


func _on_Detect_body_entered(body):
	fish_inside = true


func _on_Detect_body_exited(body):
	fish_inside = false
