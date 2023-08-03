extends Control

onready var can_continue: bool = false
onready var brasil_flag = $Menu/LanguageButtonPT
onready var estados_flag = $Menu/LanguageButtonES
onready var subtitle = $Menu/Subtitle
onready var Menu = $Menu
onready var Options = $Options
onready var Back = $Options/Panel/BackButton

# Called when the node enters the scene tree for the first time.
func _ready():
	$MenuBackgorund2/AnimationPlayer.play("Idle")
	$Terran/AnimationPlayer.play("Idle")
	set_language()
	for button in $Menu/ButtonContainer.get_children():
		button.connect("pressed", self, "on_button_pressed", [button.name])
		button.connect("mouse_exited", self, "mouse_interaction", [button, "exited"])
		button.connect("mouse_entered", self, "mouse_interaction", [button, "entered"])
		button.connect("focus_entered", self, "mouse_interaction", [button, "entered"])
		button.connect("focus_exited", self, "mouse_interaction", [button, "entered"])
	
	brasil_flag.connect("pressed", self, "on_button_pressed", [brasil_flag.name])
	estados_flag.connect("pressed", self, "on_button_pressed", [estados_flag.name])
	Back.connect("pressed", self, "on_button_pressed", [Back.name])


func on_button_pressed(button_name: String) -> void:
	match button_name:
		"BackButton":
			Menu.visible = true
			Options.visible = false
		"LanguageButtonES":
			change_language()
		"LanguageButtonPT":
			change_language()
		"StartButton":
			TransitionScreen.scene_path = "res://scenes/IntroducaoHistoria.tscn"
			TransitionScreen.fadeIn()
		"ContinueButton":
			pass
		"OptionsButton":
			Menu.visible = false
			Options.visible = true
		"QuitButton":
			get_tree().quit()

func set_language() -> void:
	var language = TranslationServer.get_locale()
	
	if language == 'pt_BR':
		brasil_flag.visible = true
		estados_flag.visible = false
	elif language == 'en':
		brasil_flag.visible = false
		estados_flag.visible = true


func change_language() -> void:
	var language = TranslationServer.get_locale()
	
	if language == 'pt_BR':
		TranslationServer.set_locale('en')
		brasil_flag.visible = false
		estados_flag.visible = true
	elif language == 'en':
		TranslationServer.set_locale('pt_BR')
		brasil_flag.visible = true
		estados_flag.visible = false


func mouse_interaction(button: Button, type: String) -> void:
	match type:
		"exited":
			button.modulate.a = 1.0
		"entered":
			if button.name == 'ContinueButton' and not can_continue:
				return
			button.modulate.a = 0.5
