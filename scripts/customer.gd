extends CharacterBody2D

var speed = 0
var minSpeed = 200.0
var maxSpeed = 300.0
var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	speed = rng.randf_range(minSpeed, maxSpeed)
	pass

func _physics_process(_delta):
	var direction = -1
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	move_and_slide()
	if (position.x < 0):
		queue_free()
