extends Node

var portrait_jornalista: String = 'res://resources/dialogueBox/jornalista.png'
var portrait_astronauta: String = 'res://resources/dialogueBox/eu.png'
var portrait_desconhecido: String = 'res://resources/dialogueBox/desconhecido.png'

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

func get_first_dialog_planet():
	return [
		{"name": "${name_player}", "text": "Nossa, o que foi isso?", "portrait": portrait_astronauta},
		{"name": "${name_player}", "text": "Eu achei que não sairia vivo dessa.", "portrait": portrait_astronauta},
		{"name": "${name_player}", "text": "Que bom que estavamos errados sobre buracos negros.", "portrait": portrait_astronauta},
		{"name": "${name_player}", "text": "O motor de dobra falhou mas pelo menos ao cair o airbag me manteve vivo.", "portrait": portrait_astronauta},
		{"name": "${name_player}", "text": "Espere, algumas coisas estão me observando? Mas nunca achamos ninguem no universo.", "portrait": portrait_astronauta},
		{"name": "Figura Misteriosa", "text": "Vá embora intruso, so avisaremos uma vez!", "portrait": portrait_desconhecido}
	]
