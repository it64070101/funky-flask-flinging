extends Node2D

var flaskStore

# Called when the node enters the scene tree for the first time.
func _ready():
	flaskStore = 0
	Gbl.gameStart = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func addFlaskStore():
	flaskStore += 1
	print(flaskStore)
	if flaskStore >= 5:
		$Camera/Control.gameOverScreen()
		Gbl.gameStart = false