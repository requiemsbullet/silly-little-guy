extends CanvasLayer

@onready var animation_player: AnimationPlayer = $AnimationPlayer
var tp := false

func change_scene_file(target:String) -> void:
	tp = true
	animation_player.play("dissolve")
	await animation_player.animation_finished
	get_tree().change_scene_to_file(target)
	animation_player.play_backwards("dissolve")
	tp = false

func change_scene_packed(target:PackedScene) -> void:
	tp = true
	animation_player.play("dissolve")
	await animation_player.animation_finished
	get_tree().change_scene_to_packed(target)
	animation_player.play_backwards("dissolve")
	tp = false
