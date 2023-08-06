extends Node

var portrait_jornalista: String = 'res://resources/dialogueBox/jornalista.png'
var portrait_astronauta: String = 'res://resources/dialogueBox/eu.png'

func get_intro_dialog():
	return [
		{"name": "Repórter Billiam Wonner", "text": "Interrompemos a programação para uma noticia importante!", "portrait": portrait_jornalista},
		{"name": "Repórter Billiam Wonner", "text": "Iniciaremos nossos testes praticos com o motor de dobra.", "portrait": portrait_jornalista},
		{"name": "Repórter Billiam Wonner", "text": "Onde conseguiremos ir a locais jamais alcançados pela humanidade no universo.", "portrait": portrait_jornalista},
		{"name": "Repórter Billiam Wonner", "text": "Hoje as 20:00Hrs faremos uma live para lançarmos nosso astronauta ${name_player}.", "portrait": portrait_jornalista}
	]


func get_first_animation_dialog():
	return [
		{"name": "${name_player}", "text": "Finalmente minha primeira missao!", "portrait": portrait_astronauta},
		{"name": "${name_player}", "text": "Que sorte que iniciarei minha jornada sendo o primeiro a testar o motor de dobra.", "portrait": portrait_astronauta},
		{"name": "${name_player}", "text": "Meu destino será ALPHA CENTAURI IV.", "portrait": portrait_astronauta},
		{"name": "${name_player}", "text": "Vamos lá! Ligando.", "portrait": portrait_astronauta}
	]
