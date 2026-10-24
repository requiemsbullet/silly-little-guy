extends Control
@onready var audio: AudioStreamPlayer = $AudioStreamPlayer

@onready var label: Label = $Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.modulate.a = 0.0
	label.show()
	audio.play()
	
	var tween = create_tween()
	tween.tween_property(label, "modulate:a",1.0,6.0)
	await get_tree().create_timer(10.0).timeout
	get_tree().change_scene_to_file("res://scenes/mainmenu.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
