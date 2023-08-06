extends Node2D

signal finished

onready var animation: AnimationPlayer = $AnimationPlayer

onready var label_name: Label = $Background/Name
onready var portrait: TextureRect = $Background/Portrait
onready var text_label: RichTextLabel = $Background/TextLabel
onready var timer: Timer = $Timer

var can_skip_dialog: bool = false

var dialog_size: int
var dialog_index: int = 0

var dialog_list: Dictionary = {}

export(float) var wait_time = 0.02

func _ready():
	dialog_size = dialog_list["Dialog"].size()
	
	if dialog_list["Portrait"] != null:
		label_name.text = dialog_list["name"]
		portrait.texture = load(dialog_list["portrait"])
	
	show_dialog()

func _process(_delta):
	if Input.is_action_just_pressed("INTERACT") and can_skip_dialog:
		can_skip_dialog = false
		show_dialog()

func show_dialog():
	if dialog_index == dialog_size:
		animation.play("FadeOut")
		yield(animation, "animation_finished")
		emit_signal("finished")
		queue_free()
		return
	
	text_label.percent_visible = 0
	text_label.text = dialog_list["dialog"][dialog_index]
	dialog_index += 1
	
	while text_label. visible_characters < len(text_label.text):
		text_label.visible_characters+= 1
		timer.start(wait_time)
		yield(timer, "timeout")
	
	can_skip_dialog = false
