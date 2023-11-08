extends State
class_name EnemyAttack

@export var enemy: CharacterBody2D
@export var move_speed := 40.0

var player: CharacterBody2D
var attacked = false

func _ready():
	pass # Replace with function body.

func Enter():
	player = get_tree().get_first_node_in_group("player")

func Exit():
	pass

func Update(delta: float):
	pass
	
func Physics_Update(delta: float):
	var direction = Vector2()
	
	if player:
		direction = player.global_position - enemy.global_position
	
	if direction.length() <= 25 && !attacked:
		enemy.attack()
		attacked = true

func _on_animation_player_animation_finished(anim_name):
	print("animation player finished")
	if anim_name == "attack":
		print("animation player finished attack")
		attacked = false
	Transitioned.emit(self, "EnemyIdleWander")
