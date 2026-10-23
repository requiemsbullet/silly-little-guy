extends Node2D

var button_type = null

func _ready():
	buttonmanager.visible = true
	optionsmenu.visible = false

func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")

@onready var buttonmanager: Control = $buttonmanager
@onready var optionsmenu: Panel = $optionsmenu

func _on_options_pressed() -> void:
	buttonmanager.visible = false
	optionsmenu.visible = true


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_back_options_pressed() -> void:
	_ready()


func _on_h_slider_value_changed(value: float) -> void:
	pass # Replace with function body.
