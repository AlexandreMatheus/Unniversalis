extends CanvasLayer

onready var animation: AnimationPlayer = get_node("Animation")

var scene_path : String = ""

func fadeIn() -> void:
	animation.play("FadeIn")


func _on_animation_finished(anim_name: String) -> void:
	if anim_name == "FadeIn":
		var _change_scene: bool = get_tree().change_scene(scene_path)
		animation.play("FadeOut")
