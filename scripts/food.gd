extends Area2D

@export var foodsprite: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Sprite2D.frame = foodsprite


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("grow"):
		body.grow()
		set_deferred("monitoring", false)
		var tween = create_tween()
		tween.tween_property(self, "modulate:a", 0.0,0.1)
		$AudioStreamPlayer2D.play()
		await tween.finished
		await $AudioStreamPlayer2D.finished
		queue_free()
