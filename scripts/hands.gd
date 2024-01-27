extends CharacterBody2D

const SPEED = 5000.0
var canShoot = true
var picking = false
var haveFlask = true

var flaskBody = null

var holdingFlask = null
var shootingFlask = null

var lockScroll = false

#func _process(_delta):
	#print("shootflask : " + str(shootingFlask) + "|" + "holdflask : " + str(holdingFlask)+'\n')
	#print(is_instance_valid(holdingFlask))

func _physics_process(_delta):

	var direction = get_local_mouse_position().normalized().x
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()

func _input(event):

	if Gbl.gameStart:
		if event is InputEventMouseButton:
			if event.button_index == MOUSE_BUTTON_LEFT and event.pressed and canShoot and not(picking) and flaskBody and not(Gbl.lockShoot) and is_instance_valid(holdingFlask):
				shootingFlask = load("res://nodes/flask.tscn").instantiate()
				get_parent().add_child(shootingFlask)
				shootingFlask.position = position
				print(shootingFlask.tag)
				print(holdingFlask.tag)
				shootingFlask.tag = holdingFlask.tag
				shootingFlask.changeTexture(holdingFlask.tag)
				holdingFlask.queue_free()
				Gbl.lockShoot = true
				flaskBody = null
				holdingFlask = null
				$shoot.play()
				await try_await()
			elif event.button_index == MOUSE_BUTTON_LEFT and event.pressed and picking and flaskBody and is_instance_valid(flaskBody):
				holdingFlask = load("res://nodes/flask.tscn").instantiate()
				holdingFlask.gravity_scale = 0
				add_child(holdingFlask)
				holdingFlask.global_position = global_position
				holdingFlask.tag = flaskBody.tag
				holdingFlask.inHand(holdingFlask.tag)
				flaskBody.changeTexture(holdingFlask.tag)
				flaskBody.queue_free()
				$cilck.play()
				get_parent().deleteFlaskStore()
			elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN and event.pressed and not(Gbl.lockShoot) and !lockScroll:
				lockScroll = true
				$"../Timer".start()
				picking = true
				position.y = 1740
				get_parent().get_node("Camera").position.y = 1620
			elif event.button_index == MOUSE_BUTTON_WHEEL_UP and event.pressed and not(Gbl.lockShoot) and !lockScroll:
				lockScroll = true
				$"../Timer".start()
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


func _on_timer_timeout():
	lockScroll = false
