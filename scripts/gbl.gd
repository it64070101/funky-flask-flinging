extends Node
var rng = RandomNumberGenerator.new()
var flask = ["Bomb","Frog","GenderBend","DeAge","Fly","Normal"]
var randomflask = 0
var money = 0
var stress = 0
var combo = 0
var flaskStore = 0
var gameStart = false
var lockShoot = false
var increasingTime = 0
var speedTime = 1

func _ready():
	gameStart = false

func addMoney():
	money += combo

func addStress():
	stress += 1

func addCombo():
	combo += 1

func addFlaskStore():
	flaskStore += 1
	if flaskStore >= 5:
		#$Control.gameOverScreen()
		get_tree().change_scene_to_file("res://nodes/game_over.tscn")
