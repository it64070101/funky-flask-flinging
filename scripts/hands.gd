extends CharacterBody2D


const SPEED = 1000.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var onHand
var handObject

func _ready():
	onHand = false


func _physics_process(delta):

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var direction = Input.get_axis("ui_left", "ui_right")
	var direction = get_local_mouse_position().normalized().x
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		print("I collided with ", collision.get_collider().name)

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed and onHand:
			#self.add_child(handObject)
			print('left')
			var flask = load("res://nodes/flask.tscn").instantiate()
			get_parent().add_child(flask)
			flask.position = position
