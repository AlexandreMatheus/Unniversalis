extends KinematicBody2D

export (int) var speed = 400
export (int) var maxLeft = 0
export (int) var maxRight = 29

var rng = RandomNumberGenerator.new()
var target: Vector2 = Vector2()
var velocity: Vector2 = Vector2()

func _ready():
	target = position
	rng.randomize()
	update_target()

func _process(delta):
	velocity = position.direction_to(target) * speed
	if position.distance_to(target) > 1.5:
		velocity = move_and_slide(velocity)
	else:
		update_target()

func update_target():
	var my_random_number = rng.randf_range(maxLeft, maxRight)
	target.x = my_random_number
