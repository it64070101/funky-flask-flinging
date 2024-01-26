extends RigidBody2D
@export var spritelist = []

# Called when the node enters the scene tree for the first time.
func _ready():
	$sprite.set_texture(spritelist[1])
	name = "1"+str(1)
	print(name)
	 # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	print(Gbl.flask[2])
	if (position.y <= -10):
		queue_free()


func _on_check_customer_body_entered(body):
	if (body.name == "Customer"):
		self.queue_free()
