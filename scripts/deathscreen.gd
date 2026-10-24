extends Control

@onready var label: Label = $MarginContainer/Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameState.obesity = 0
	label.text = DeathAutoload.death_message


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/main2.tscn")
