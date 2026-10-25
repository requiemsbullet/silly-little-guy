extends Area2D
@onready var intbox: Sprite2D = $InteractionBox
@onready var beep: AudioStreamPlayer = $beep
@onready var beep2: AudioStreamPlayer = $beep2
@onready var player: Player = $"../Player"


var player_near := false
var lines: Array[String] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	intbox.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		var obs = GameState.obesity
		if player_near and obs > 7:
			beep2.play()
			await beep2.finished
			GameState.playerpos = player.global_position
			GameState.obese_ending = true
			SceneTransition.change_scene_file("res://scenes/endings/main_obese.tscn")
			queue_free()
		elif player_near and obs >= 4:
			SceneTransition.change_scene_file("res://scenes/endings/fatending.tscn")
		elif player_near and obs >= 1:
			SceneTransition.change_scene_file("res://scenes/endings/noobend.tscn")
		elif player_near and obs == 0:
			get_tree().quit()
			
			
			
	


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		intbox.visible = true
		player_near = true


func _on_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		intbox.visible = false
		player_near = false
