extends Node2D

export(String, FILE) var game_scene = ''

var listDialogue = {
	"ExitedPlanet" : [
		{"name": "Eu", "text": "Finalmente minha primeira missao!"},
		{"name": "Eu", "text": "Que sorte que iniciarei minha jornada sendo o primeiro a testar o motor de dobra."},
		{"name": "Eu", "text": "Meu destino será ALPHA CENTAURI IV."},
		{"name": "Eu", "text": "Vamos lá! Ligando."}
	],
}

func _ready():
	$AnimationPlayer.play("Inicio")
	var conection = $DialogueBox.connect('dialogue_ended', self, "next_animation")
	pass # Replace with function body.

func call_dialogue_exited_planet():
	$DialogueBox.start(listDialogue['ExitedPlanet'])

func next_animation():
	$AnimationPlayer.play("Final")

func next_scene():
	TransitionScreen.scene_path = "res://scenes/Cena1.tscn"
	TransitionScreen.fadeIn()
