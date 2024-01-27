extends Node2D

func _on_start_pressed():
	$click.play()
	get_tree().change_scene_to_file("res://nodes/test_scene.tscn")


func _on_credit_pressed():
	$click.play()
	get_tree().change_scene_to_file("res://nodes/credit.tscn")


func _on_how_to_play_pressed():
	$click.play()
	get_tree().change_scene_to_file("res://nodes/tutorial.tscn")
