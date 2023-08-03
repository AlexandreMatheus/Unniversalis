extends Node2D

var listDialogue = [
	{"name": "Tv", "text": "Interrompemos a programação para uma noticia importante!"},
	{"name": "Tv", "text": "Iniciaremos nossos testes praticos com o motor de dobra."},
	{"name": "Tv", "text": "Onde conseguiremos ir a locais jamais alcançados pela humanidade no universo."},
	{"name": "Tv", "text": "Hoje as 20:00Hrs faremos uma live para lançarmos nosso astronauta."}
]

func _ready():
	var conection = $DialogueBox.connect('dialogue_ended', self, "next_scene")
	$DialogueBox.start(listDialogue)
	pass # Replace with function body.

func next_scene():
	TransitionScreen.scene_path = "res://scenes/Animation1.tscn"
	TransitionScreen.fadeIn()
