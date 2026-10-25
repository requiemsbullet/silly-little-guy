extends Area2D
@onready var intbox: Sprite2D = $InteractionBox
@onready var beep: AudioStreamPlayer = $beep


var player_near := false
var lines: Array[String] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if GameState.obesity >= 3:
		lines = [
			"WOW YOU'RE SOMEWHAT BIG",
			"NOT AS BIG AS MY MUSCLES THO",
			"YOU MIGHT HAVE A CHANCE AT JOINING US BIG GUYS",
			"KIDDING YOU'RE NOT BIG ENOUGH",
			"GET LOST",
		]
	else:
		lines = [
			"WOW HOW DID A TINY THING LIKE YOU GET THIS FAR?",
			"GET LOST, YOU HAVE NO PLACE ON THIS MOUNTAIN",
		]
	intbox.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		if player_near and not DialogueManager.is_dialog_active:
			intbox.visible = false
			beep.play()
			DialogueManager.start_dialog(global_position, lines)
			
			
	


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		intbox.visible = true
		player_near = true


func _on_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		intbox.visible = false
		player_near = false
