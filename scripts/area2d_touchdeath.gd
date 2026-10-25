extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		DeathAutoload.trashtalk = true
		DeathAutoload.death_message = "you failed the jump and are now forever stuck"
		await get_tree().create_timer(5.0).timeout
		get_tree().change_scene_to_file("res://scenes/deathscreen.tscn")
