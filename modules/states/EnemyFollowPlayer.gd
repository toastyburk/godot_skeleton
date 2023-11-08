extends State
class_name EnemyFollowPlayer


@export var enemy: CharacterBody2D
@export var move_speed := 40.0

var player: CharacterBody2D

var move_direction: Vector2
var wander_time: float

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
	
	if is_instance_valid(player):
		direction = player.global_position - enemy.global_position
	
	enemy.velocity = direction.normalized() * move_speed
	enemy.rotation = direction.normalized().angle() + PI/2
	
#	if direction.length() > 25:
#		enemy.velocity = direction.normalized() * move_speed
#	else:
#		enemy.velocity = Vector2()
#		Transitioned.emit(self, "EnemyAttack")
	
	if direction.length() > 100:
		Transitioned.emit(self, "EnemyIdleWander")
