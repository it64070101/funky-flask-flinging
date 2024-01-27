extends Node
var rng = RandomNumberGenerator.new()
var flask = ["Bomb","Frog","GenderBend","DeAge","Fly","Normal"] # plase add name
var randomflask = 0
var money = 0
var stress = 0
var combo = 0

func addMoney():
	money += combo

func addStress():
	stress += 1

func addCombo():
	combo += 1
