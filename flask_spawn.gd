extends Node2D

var cooldown = 0
var second = 1
var rng = RandomNumberGenerator.new()

func _ready():
	pass

func _process(delta):
	if Gbl.gameStart:
		cooldown += delta
		if(cooldown >= second):
			rng.randomize()
			var flask = load("res://nodes/flask.tscn").instantiate()
			flask.set_gravity_scale(1)
			add_child(flask)
			flask.position.x = rng.randi_range(-960, 960)
			cooldown = 0
			Gbl.randomflask = int(rng.randf_range(0, 6.0))
			flask.set_random_flask()
			get_parent().addFlaskStore()
