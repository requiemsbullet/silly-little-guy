
extends Area2D

func _ready():
	body_entered.connect(_on_body_entered)
	print("Transition zone is ready!")

func _on_body_entered(body):
	print("Something entered: ", body.name)

	if body.is_in_group("player"):
		print("Player detected! Loading Level 2...")
		get_tree().change_scene_to_file(
			"res://scenes/levels/main2.tscn")
