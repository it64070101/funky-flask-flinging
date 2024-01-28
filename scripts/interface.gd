extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
func gameOverScreen():
	$"Game Over".visible = true
	$Button2.visible = true
	#$"Game Over".set_text("Game Over\nToo Many Flasks")
