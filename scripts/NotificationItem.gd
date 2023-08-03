extends Node2D

onready var progress = $ProgressBar

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	progress.value -= 0.3
	if (progress.value <= 0):
		queue_free()
