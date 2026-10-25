extends Area2D

@export_enum("fat","girl","muscle","tall") var sprite: String = "fat"
@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
@onready var audio: AudioStreamPlayer2D = $AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	anim.play(sprite)





func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		audio.play()
		anim.play("explode")
		await anim.animation_finished
		GameState.explosions += 1
		queue_free()
