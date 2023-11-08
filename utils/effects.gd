extends Node
class_name Effects

# slows/freezes the frame to a timescale (10th degree), for seconds duration
# good for emphasizes a powerful spell/attack/effect
# 0.1, 0.4s is a good setting as a start.
func frameFreeze(timeScale, duration):
	Engine.time_scale = timeScale
	await get_tree().create_timer(duration * timeScale).timeout
	Engine.time_scale = 1.0
