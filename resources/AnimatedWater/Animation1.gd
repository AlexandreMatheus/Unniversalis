extends Node2D

export(String, FILE) var game_scene = ''

func _ready():
	$AnimationPlayer.play("Inicio")
	var conection = $DialogueBox.connect('dialogue_ended', self, "next_animation")
	pass # Replace with function body.

func call_dialogue_exited_planet():
	$DialogueBox.start(ListDialog.get_first_animation_dialog())

func next_animation():
	$AnimationPlayer.play("Final")

func next_scene():
	TransitionScreen.scene_path = "res://scenes/Cena1.tscn"
	TransitionScreen.fadeIn()
