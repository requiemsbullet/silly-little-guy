extends CharacterBody2D


const SPEED = 180.0
const JUMP_VELOCITY = -300.0


var appearence := "normal"
var obesity := 0
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@export var MAX_OBESITY : int
@export var MEDIUM_OBESITY: int
@export var STARTING_OBESITY: int
@export var scale_by: Vector2


func grow():
	if obesity != MAX_OBESITY:
		obesity += 1
		scale += scale_by
	update_appearence()
	
	
func update_appearence():
	if obesity == MAX_OBESITY:
		appearence = "obese"
	elif obesity >= MEDIUM_OBESITY:
		appearence = "fat"
	elif obesity >= STARTING_OBESITY:
		appearence = "normal"

	match appearence:
		"normal":
			sprite.play("normal_idle")
		"fat":
			sprite.play("fat_idle")
		"obese":
			sprite.play("obese_idle")
		
func _ready() -> void:
	pass
	
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		$AudioStreamPlayer.play()
		velocity.y = JUMP_VELOCITY + obesity * MAX_OBESITY
		await $AudioStreamPlayer.finished
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction != 0:
		velocity.x = direction * (SPEED - obesity * MAX_OBESITY)
		sprite.play(appearence + "_walk")
		sprite.flip_h = direction < 0
	else:
		sprite.play(appearence + "_idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
