extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(position.y)
	if (position.y <= -10):
		queue_free()


func _on_check_customer_body_entered(body):
	if (body.name == "Customer"):
		self.queue_free()
