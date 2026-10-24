extends Area2D
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var intbox: Sprite2D = $InteractionBox
@onready var beep: AudioStreamPlayer = $beep

var player_near := false

const lines: Array[String] = [
	"I suggest you go home.",
	"This is the big guy mountain. Only big guys can climb it.",
	"And you're too small you're just a tiny little guy.",
	"But if you do decide to climb it...",
	"You should try getting big.",
]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	intbox.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	
	if body is CharacterBody2D:
		intbox.visible = true
		player_near = true


func _on_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		intbox.visible = false
		player_near = false

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		if player_near and not DialogueManager.is_dialog_active:
			intbox.visible = false
			beep.play()
			DialogueManager.start_dialog(global_position, lines)
			intbox.visible = true
			
	
