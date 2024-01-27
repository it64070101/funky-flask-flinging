extends RigidBody2D

@export var spritelist = []
var isInHand

var tag = ""

var isShoot
# Called when the node enters the scene tree for the first time.
var random_number

var smoke = preload("res://resources/SFX/smokes.tscn")
var hit = preload("res://nodes/hit.tscn")
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
		#play hit sound
		var hitPlayer = hit.instantiate()
		self.get_parent().add_child(hitPlayer)
		hitPlayer.playhit()
		print(body.getWantFlask(),tag)
		if (tag == "Bomb"):
			var smokePlayer = smoke.instantiate()
			self.get_parent().add_child(smokePlayer)
			print(smokePlayer.get_parent())
			smokePlayer.global_position = body.global_position
			smokePlayer.playSmoke()
		elif (tag == "Fly"):
			body.gravity = -5000
		elif(tag == "Frog"):
			body.changeToFrog()
		elif(tag == "GenderBend"):
			if(body.gender == "Female"):
				body.changeToMale()
			else:
				body.changeToFemale()
		elif(tag == "DeAge"):
			body.deAge()
		if(body.getWantFlask() == tag):
			get_parent().addMoney()
			Gbl.lockShoot = false
			body.customerDying()
			self.queue_free()
		else:
			Gbl.lockShoot = false
			get_parent().anim.play('flashred')
			body.customerDying()
			self.queue_free()
			get_parent().addStress()

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

