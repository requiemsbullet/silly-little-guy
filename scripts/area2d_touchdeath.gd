extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		DeathAutoload.trashtalk = true
		DeathAutoload.death_message = "you failed the jump and are now forever stuck"
		await get_tree().create_timer(5.0).timeout
		get_tree().change_scene_to_file("res://scenes/deathscreen.tscn")
