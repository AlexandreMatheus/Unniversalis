extends CanvasLayer

var dialogue = []
var current_dialogue_id = 0
var d_active = false
signal dialogue_ended

func _ready():
	$DialogueBox.visible = false

func start(dialogue_passed):
	if d_active:
		return
	d_active = true
	$DialogueBox.visible = true
	dialogue = dialogue_passed
	current_dialogue_id = -1
	next_script()

func _input(event):
	if not d_active:
		return
	elif event.is_action_pressed("ESPACO"):
		next_script()

func next_script():
	current_dialogue_id += 1
	
	if current_dialogue_id >= len(dialogue):
		d_active = false
		$DialogueBox.visible = false
		emit_signal("dialogue_ended")
		return
	
	$DialogueBox/Nome.text = dialogue[current_dialogue_id]['name']
	$DialogueBox/Texto.text = dialogue[current_dialogue_id]['text']
