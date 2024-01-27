extends CharacterBody2D

@export var customerSpriteList = []
@export var customerWantList = []

var speed
var minSpeed = 50.0
var maxSpeed = 100.0
var wantFlask
var rng = RandomNumberGenerator.new()
var gender
var age
var gravity = 0

func _ready():
	rng.randomize()
	speed = rng.randf_range(minSpeed, maxSpeed)
	wantFlask = rng.randi_range(0, 5)
	var spriteID = rng.randi_range(0, 5)
	$Custosprite.set_texture(customerSpriteList[spriteID])
	if (spriteID == 0 || spriteID == 1 || spriteID == 2):
		gender = "Female"
	else:
		gender = "Male"
		
	if (spriteID == 0 || spriteID == 3):
		age = "young"
	elif (spriteID == 2 || spriteID == 5):
		age = "adult"
	else:
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
	velocity.y += gravity * _delta
	
	move_and_slide()
	if (position.x < 0):
		queue_free()

func getWantFlask():
	return Gbl.flask[wantFlask]
	
func customerDying():
	$hit.play()
	speed = 0
	$CollisionShape2D.queue_free()
	await get_tree().create_timer(2).timeout
	self.queue_free()
	
func changeToFrog():
	$frog.play()
	$Custosprite.texture = load("res://resources/sprites/frog.png")

func changeToMale():
	$genderbend.play()
	$Custosprite.set_texture(customerSpriteList[6])

func changeToFemale():
	$genderbend.play()
	$Custosprite.set_texture(customerSpriteList[7])
	
func deAge():
	$deage.play()
	if (age == "young"):
		$Custosprite.texture = null
	elif (age == "adult" && gender == "Female"):
		$Custosprite.set_texture(customerSpriteList[0])
	elif (age == "adult"):
		$Custosprite.set_texture(customerSpriteList[3])
	elif (gender == "Female"):
		$Custosprite.set_texture(customerSpriteList[2])
	else:
		$Custosprite.set_texture(customerSpriteList[5])

func onEffect():
	$noeff.play()
func setfly():
	$fly.play()
