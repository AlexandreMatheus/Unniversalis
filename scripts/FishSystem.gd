extends Node2D

onready var textureProgress: ProgressBar = $ProgressBar
onready var player: KinematicBody2D = $PlayerFish


# Called when the node enters the scene tree for the first time.
func _ready():
	player.connect("update_progress", self, "_on_Player_update_progress")
	textureProgress.value = 1

func _on_Player_update_progress(value):
	textureProgress.value = value
