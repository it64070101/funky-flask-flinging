extends RigidBody2D
@export var spritelist = []
# Called when the node enters the scene tree for the first time.
func _ready():
	$sprite.set_texture(spritelist[0])
	pass
	 # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if (position.y <= -10):
		queue_free()


func _on_check_customer_body_entered(body):
	if (body.name == "Customer"):
		self.queue_free()

func set_random_flask():
	var random_number = int(Gbl.rng.randf_range(0, 6.0))
	$sprite.set_texture(spritelist[random_number])
