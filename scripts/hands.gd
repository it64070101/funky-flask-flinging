extends CharacterBody2D

const SPEED = 1000.0
const JUMP_VELOCITY = -400.0
var canShoot = true
var picking = false
var haveFlask = true

func _physics_process(_delta):

	var direction = get_local_mouse_position().normalized().x
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed and canShoot and not(picking) and haveFlask:
			var flask = load("res://nodes/flask.tscn").instantiate()
			get_parent().add_child(flask)
			# set diff flask
			flask.set_random_flask()
			haveFlask = false
			flask.position = position
			await try_await()
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed and picking:
			print(123)
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN and event.pressed:
			picking = true
			position.y = 1740
			get_parent().get_node("Camera").position.y = 1620
		elif event.button_index == MOUSE_BUTTON_WHEEL_UP and event.pressed:
			picking = false
			position.y = 660
			get_parent().get_node("Camera").position.y = 540

func try_await():
	canShoot = false
	await get_tree().create_timer(1).timeout
	canShoot = true


func _on_area_2d_body_entered(body):
	print(body.get_parent())
	#body.get_parent().remove_child(body)
	#self.get_parent().add_child(body)
	
	#add_child(body)
