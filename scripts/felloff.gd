extends Area2D


@onready var audio: AudioStreamPlayer = $"../AudioStreamPlayer"


@onready var audio2: AudioStreamPlayer2D = $"../AudioStreamPlayer2D"



func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		
		DeathAutoload.death_message = "you fell"
		audio.stop()
		audio2.play()
		await get_tree().create_timer(2.0).timeout
		get_tree().change_scene_to_file("res://scenes/deathscreen.tscn")
