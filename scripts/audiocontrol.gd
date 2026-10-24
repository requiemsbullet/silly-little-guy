extends HSlider

@export var audio_bus_name: String = "Master"

var audio_bus_id: int

func _ready() -> void:
	audio_bus_id = AudioServer.get_bus_index(audio_bus_name)

	if audio_bus_id == -1:
		push_error("Audio bus not found: " + audio_bus_name)
		return

	value = db_to_linear(
		AudioServer.get_bus_volume_db(audio_bus_id)
	)

	value_changed.connect(_on_value_changed)

func _on_value_changed(new_value: float) -> void:
	AudioServer.set_bus_volume_linear(audio_bus_id, new_value)
