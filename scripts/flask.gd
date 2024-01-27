extends RigidBody2D

@export var spritelist = []
var isInHand

var tag = ""

var isShoot
# Called when the node enters the scene tree for the first time.
var random_number

func _ready():
	#$sprite.set_texture(spritelist[0])
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
		print(body.getWantFlask(),tag)
		if(body.getWantFlask() == tag):
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
	random_number = Gbl.rng.randi_range(0, 5)
	$sprite.set_texture(spritelist[random_number])
	name = Gbl.flask[random_number]
	tag = Gbl.flask[random_number]

func inHand(testtag):
	changeTexture(testtag)
	isInHand = true
	set_collision_layer(2)
	#set_collision_mask(2)

func changeTexture(nameTexture):
	$sprite.set_texture(spritelist[Gbl.flask.find(nameTexture)])

