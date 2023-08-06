extends Node2D

func _ready():
	var conection = $DialogueBox.connect('dialogue_ended', self, "next_scene")
	var conectionFade = TransitionScreen.connect('end_Fade_Out', self, "start_dialog")

func next_scene():
	TransitionScreen.scene_path = "res://scenes/Animation1.tscn"
	TransitionScreen.fadeIn()

func start_dialog():
	$DialogueBox.start(ListDialog.get_intro_dialog())
