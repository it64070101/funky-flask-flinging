extends Node2D

func playhit():
	$Timer.start()
	$hit.play()

func _on_timer_timeout():
	self.queue_free()
