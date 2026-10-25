extends Area2D

const evil = preload("uid://buxarsuo785gr")
var triggered = false

func _on_body_entered(body: Node2D) -> void:
	if triggered:
		return
	if body is CharacterBody2D:
		triggered = true
		await get_tree().create_timer(1.2).timeout
		var killguy = evil.instantiate()
		killguy.global_position = Vector2(400,150)
		get_tree().current_scene.add_child(killguy)
