extends RigidBody2D

@export var spritelist = []
var isInHand

var tag = ""

var isShoot
# Called when the node enters the scene tree for the first time.
var random_number

func _ready():
	$sprite.set_texture(spritelist[0])
	isInHand = false
	isShoot = false
	tag = ""
	pass

func _process(_delta):
	if (position.y <= -10):
		queue_free()
		Gbl.lockShoot = false
	if isInHand:
		global_position = get_parent().get_node("CollisionShape2D").global_position

func _on_check_customer_body_entered(body):
	if (body.is_in_group("customer")):
		if(body.getWantFlask() == random_number):
			print("yes")
			Gbl.lockShoot = false
			body.queue_free()
			self.queue_free()
		else:
			print("No")
			Gbl.lockShoot = false
			body.queue_free()
			self.queue_free()

func set_random_flask():
	random_number = int(Gbl.rng.randf_range(0, 6.0))
	$sprite.set_texture(spritelist[random_number])
	name = Gbl.flask[random_number]
	tag = Gbl.flask[random_number]

func inHand():
	isInHand = true
	set_collision_layer(2)
	#set_collision_mask(2)

func shooting():
	print('shoot')
	isInHand = false
	global_position = get_parent().global_position
	set_gravity_scale(-1)
	set_collision_layer(1)
	print(get_parent().name, self.name)
