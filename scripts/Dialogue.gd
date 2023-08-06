extends CanvasLayer

var dialogue = []
var current_dialogue_id = 0
var d_active = false
signal dialogue_ended

onready var label_name: Label = $DialogueBox/Nome
onready var portrait: TextureRect = $DialogueBox/MePicture
onready var text_label: RichTextLabel = $DialogueBox/Texto
onready var espaco: Sprite = $DialogueBox/espaco
onready var timer: Timer = $Timer
export(float) var wait_time = 0.02
export(float) var wait_time_fade = 0.5
var can_skip_dialog: bool = false

func _process(_delta):
	if can_skip_dialog:
		espaco.visible = true
	else:
		espaco.visible = false

	if Input.is_action_just_pressed("ESPACO") and can_skip_dialog and d_active:
		can_skip_dialog = false
		next_script()

func _ready():
	pass

func start(dialogue_passed):
	print(d_active)
	if d_active:
		return
	$AnimationPlayer.play("FadeIn")
	timer.start(wait_time_fade)
	yield(timer, "timeout")
	d_active = true
	dialogue = dialogue_passed
	current_dialogue_id = -1
	next_script()

func next_script():
	current_dialogue_id += 1
	
	if current_dialogue_id >= len(dialogue):
		d_active = false
		$AnimationPlayer.play("FadeOut")
		timer.start(wait_time_fade)
		yield(timer, "timeout")
		emit_signal("dialogue_ended")
		return

	text_label.percent_visible = 0
	var nome = dialogue[current_dialogue_id]['name']
	var text = dialogue[current_dialogue_id]['text']
	
	if dialogue[current_dialogue_id]['text'].find('${name_player}') != -1:
		text = dialogue[current_dialogue_id]['text'].replace('${name_player}', Utils.get_name_player())
	if dialogue[current_dialogue_id]['name'].find('${name_player}') != -1:
		nome = dialogue[current_dialogue_id]['name'].replace('${name_player}', Utils.get_name_player())
		
	$DialogueBox/Nome.text = nome
	$DialogueBox/Texto.text = text
	$DialogueBox/MePicture.texture = load(dialogue[current_dialogue_id]['portrait'])
	
	while text_label.visible_characters < len(text_label.text):
		text_label.visible_characters+= 1
		timer.start(wait_time)
		yield(timer, "timeout")

	can_skip_dialog = true
