extends Node2D

func _process(_delta: float) -> void:
	$Icon.rotate(_delta)

func _input(event: InputEvent) -> void:
	if event.is_action_released("pause"):
		call_deferred("_pause")
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
	if event.is_action_pressed("restart"):
		get_tree().change_scene_to_file(Global.SCENE_MAIN_MENU)

func _pause() -> void:
	$PauseLayer/Paused.pause()
	get_tree().paused = true
