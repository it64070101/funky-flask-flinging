extends Node2D

var flaskStore
var stress
@onready var anim = $Camera/Control/AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	flaskStore = 0
	stress = 0
	Gbl.gameStart = true
	Gbl.increasingTime = 0
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	increasing(_delta)
	pass

func addFlaskStore():
	flaskStore += 1
	#print(flaskStore)
	if flaskStore >= 60:
		$Camera/Control.gameOverScreen()
		Gbl.gameStart = false

func deleteFlaskStore():
	flaskStore -= 1

func addStress():
	stress += 1
	if stress >= 3:
		$Camera/Control.gameOverScreen()
		Gbl.gameStart = false

func increasing(delta):
	Gbl.increasingTime += delta
	return int(Gbl.increasingTime/60)
