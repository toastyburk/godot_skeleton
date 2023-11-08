extends CheckButton

func _ready() -> void:
	set_pressed_no_signal(Global.play_sfx)

func _on_toggled(bpressed: bool) -> void:
	Global.set_setting("play_sfx", bpressed)
	button_pressed = bpressed

func _on_sfx_bar_value_changed(value):
	if value <= 0:
		_on_toggled(false)
	if value > 0:
		_on_toggled(true)
	
	Global.set_setting("sfx_level", value)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Sfx"), linear_to_db(value/50))
