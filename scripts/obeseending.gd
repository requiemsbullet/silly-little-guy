extends Node2D

@onready var player: Player = $Player
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.position = GameState.playerpos
	player.scale *=2
	player.velocity.x *= 4
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var exp = GameState.explosions
	if exp >= 15:
		GameState.obese_ending = false
		GameState.obesity = 0
		GameState.explosions = 0
		SceneTransition.change_scene_file("res://scenes/endings/credits.tscn")
		
