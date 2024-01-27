extends RigidBody2D

@export var spritelist = []
var random_number

func _ready():
	$sprite.set_texture(spritelist[0])
	pass

func _process(_delta):
	if (position.y <= -10):
		queue_free()

func _on_check_customer_body_entered(body):
	if (body.is_in_group("customer")):
		if(body.getWantFlask() == random_number):
			print("yes")
			body.queue_free()
			self.queue_free()
		else:
			print("No")
			body.queue_free()
			self.queue_free()
		

func set_random_flask():
	random_number = int(Gbl.rng.randf_range(0, 6.0))
	$sprite.set_texture(spritelist[random_number])
	name = Gbl.flask[random_number]
