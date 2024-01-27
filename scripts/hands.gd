extends CharacterBody2D

const SPEED = 1000.0
const JUMP_VELOCITY = -400.0
var canShoot = true
var picking = false
var haveFlask = true

var flaskBody = null

func _physics_process(_delta):

	var direction = get_local_mouse_position().normalized().x
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()

func _input(event):

	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed and canShoot and not(picking) and flaskBody:
			#var flask = load("res://nodes/flask.tscn").instantiate()
			get_parent().add_child(flaskBody)
			flaskBody.shooting()
			#flask.set_random_flask()
			await try_await()
		elif event.button_index == MOUSE_BUTTON_LEFT and event.pressed and picking and flaskBody:
			flaskBody.get_parent().remove_child(flaskBody)
			add_child(flaskBody)
			flaskBody.global_position = global_position
			flaskBody.inHand()
			print(flaskBody.position, position)
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN and event.pressed:
			picking = true
			position.y = 1740
			get_parent().get_node("Camera").position.y = 1620
		elif event.button_index == MOUSE_BUTTON_WHEEL_UP and event.pressed:
			picking = false
			position.y = 660
			get_parent().get_node("Camera").position.y = 540

	if Gbl.gameStart:
		if event is InputEventMouseButton:
			if event.button_index == MOUSE_BUTTON_LEFT and event.pressed and canShoot and not(picking) and flaskBody:
				#var flask = load("res://nodes/flask.tscn").instantiate()
				get_parent().add_child(flaskBody)
				flaskBody.shooting()
				#flask.set_random_flask()
				await try_await()
			if event.button_index == MOUSE_BUTTON_LEFT and event.pressed and picking and flaskBody:
				flaskBody.get_parent().remove_child(flaskBody)
				add_child(flaskBody)
				flaskBody.global_position = global_position
				flaskBody.inHand()
				print(flaskBody.position, position)
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
	flaskBody = body
	#self.get_parent().add_child(body)
	
	#add_child(body)
