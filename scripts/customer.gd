extends CharacterBody2D

@export var customerSpriteList = []
@export var customerWantList = []

var speed
var minSpeed = 200.0
var maxSpeed = 200.0
var wantFlask
var rng = RandomNumberGenerator.new()
var gender
var age

func _ready():
	rng.randomize()
	speed = rng.randf_range(minSpeed, maxSpeed)
	wantFlask = rng.randi_range(0, 5)
	var spriteID = rng.randi_range(0, 5)
	$Custosprite.set_texture(customerSpriteList[spriteID])
	if (true):
		gender = "Female"
	elif (true):
		gender = "Male"
		
	if (true):
		age = "young"
	elif (true):
		age = "adult"
	elif (true):
		age = "old"
	$Want.set_texture(customerWantList[wantFlask])
	add_to_group("customer")
	#$Control/Label.set_text(Gbl.flask[wantFlask])
	pass

func _physics_process(_delta):
	var direction = -1
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	move_and_slide()
	if (position.x < 0):
		queue_free()

func getWantFlask():
	return Gbl.flask[wantFlask]
	
func customerDying():
	speed = 0
	$CollisionShape2D.queue_free()
	await get_tree().create_timer(2).timeout
	self.queue_free()
