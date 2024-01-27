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
	$Flaskstore.set_text("Flask Store: "+str(flaskStore)+"/30")
	if flaskStore >= 30:
		$Camera/Control.gameOverScreen()
		Gbl.gameStart = false

func deleteFlaskStore():
	flaskStore -= 1

func addStress():
	Gbl.stress += 1
	if Gbl.stress >= 3:
		$Camera/Control.gameOverScreen()
		Gbl.gameStart = false
	$Camera/Control/Stress.set_text("Stress "+str(Gbl.stress)+"/3")

func increasing(delta):
	Gbl.increasingTime += delta
	return int(Gbl.increasingTime/60)

func addMoney():
	Gbl.money += 1
	$Camera/Control/Money.set_text("$"+str(Gbl.money))
	


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://nodes/mainMenu.tscn")
