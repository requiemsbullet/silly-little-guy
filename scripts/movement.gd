extends CharacterBody2D


const SPEED = 180.0
const JUMP_VELOCITY = -300.0


var appearence := "normal"
var obesity := 0
var is_crouching := false
var was_on_floor := false
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@export var MAX_OBESITY : int
@export var MEDIUM_OBESITY: int
@export var STARTING_OBESITY: int
@export var scale_by: Vector2


func grow():
	if obesity != MAX_OBESITY:
		obesity += 1
		scale += scale_by
		GameState.obesity = obesity
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
	obesity = GameState.obesity
	scale = Vector2.ONE + scale_by * obesity
	update_appearence()

func _physics_process(delta: float) -> void:
	
	#crouching
	is_crouching = true if Input.is_action_pressed("crouch") and is_on_floor() else false
		
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		$AudioStreamPlayer.play()
		velocity.y = JUMP_VELOCITY + obesity + MAX_OBESITY
		await $AudioStreamPlayer.finished

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction != 0:
		velocity.x = direction * (SPEED - obesity + MAX_OBESITY)
		sprite.play(appearence + "_walk")
		sprite.flip_h = direction < 0
	else:
		sprite.play(appearence + "_idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if is_crouching:
		velocity.x = velocity.x / 3
		sprite.play(appearence + "_crouch")
	elif direction != 0:
		sprite.play(appearence + "_walk")
	else:
		sprite.play(appearence + "_idle")
	if DialogueManager.is_dialog_active:
		velocity.x = 0
		sprite.play(appearence + "_idle")
	
	move_and_slide()
	
	if is_on_floor() and not was_on_floor and obesity >= MEDIUM_OBESITY:
		$thump.pitch_scale = 0.6 if appearence == "obese" else 1.0
		$thump.play()
	was_on_floor = is_on_floor()
