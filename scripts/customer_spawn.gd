extends Node2D

var cooldown = 0
var second = 2
var rng = RandomNumberGenerator.new()

func _ready():
	pass

func _process(delta):
	cooldown += delta
	if(cooldown >= second):
		rng.randomize()
		var customer = load("res://nodes/customer.tscn").instantiate()
		add_child(customer)
		customer.position.x = 2000
		customer.position.y = rng.randi_range(144, 576)
		cooldown = 0
	pass
