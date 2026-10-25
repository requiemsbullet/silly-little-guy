extends Control
@onready var anim: AnimationPlayer = $mediocre/AnimationPlayer
@onready var mediocre: TextureRect = $mediocre
@onready var textcontainer: MarginContainer = $textcontainer

func _on_button_2_pressed() -> void:
	GameState.obesity = 0
	SceneTransition.change_scene_file("res://scenes/mainmenu.tscn")


func _on_pressed() -> void:
	GameState.obesity = 0
	SceneTransition.change_scene_file("res://scenes/mainmenu.tscn")
