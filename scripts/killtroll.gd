extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var audio: AudioStreamPlayer = $AudioStreamPlayer


func _ready() -> void:
	audio.play()
	await get_tree().create_timer(3).timeout
	queue_free()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	velocity.x = -300
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		DeathAutoload.death_message = "squirp really fell for that go back to your short cave"
		get_tree().change_scene_to_file("res://scenes/deathscreen.tscn")
