extends Node2D

var cooldown = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	cooldown = cooldown + 1
	if(cooldown >= 200):
		var flask = load("res://nodes/flask.tscn").instantiate()
		flask.set_gravity_scale(1)
		add_child(flask)
		cooldown = 0
	
	pass
	
func spawn():
	await get_tree().create_timer(1).timeout
