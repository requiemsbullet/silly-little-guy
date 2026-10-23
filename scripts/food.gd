extends Area2D

@export var foodsprite: Texture2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Sprite2D.texture = foodsprite


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("grow"):
		body.grow()
		$AudioStreamPlayer2D.play()
		await $AudioStreamPlayer2D.finished
		queue_free()
