extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		SceneTransition.change_scene_file("res://scenes/levels/main5.tscn")
