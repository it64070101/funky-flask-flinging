extends Node2D

func playSmoke():
	$GPUParticles2D.emitting = true
	$Timer.start()
	

func _on_timer_timeout():
	self.queue_free()
