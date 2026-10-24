extends Control

func _ready():
	hide()
	process_mode = Node.PROCESS_MODE_ALWAYS


func _process(_delta):
	if Input.is_action_just_pressed("pause"):
		if get_tree().paused:
			resume()
		else:
			pause()


func pause():
	show()
	get_tree().paused = true


func resume():
	get_tree().paused = false
	hide()


func _on_resume_pressed():
	resume()
