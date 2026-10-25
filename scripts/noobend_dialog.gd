extends Area2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var intbox: Sprite2D = $InteractionBox
@onready var beep: AudioStreamPlayer = $beep

var lines: Array[String] = []


func _ready() -> void:
	lines = [
		"WOW the tiny LOSER actually got up the mountain",
		"there is NO place for you here",
		"didn't i tell you already? even if you managed to climb it",
		"WE'LL JUST PUSH YOU OFF OF IT!",
	]
	intbox.visible = false

	await get_tree().create_timer(1.0).timeout
	beep.play()
	DialogueManager.start_dialog(global_position, lines)

	while DialogueManager.is_dialog_active:
		await get_tree().process_frame

	SceneTransition.change_scene_file("res://scenes/mainmenu.tscn")
