extends State
class_name EnemyIdleWander

@export var enemy: CharacterBody2D
@export var move_speed := 100.0

var move_direction: Vector2
var wander_time: float

var player: CharacterBody2D

func _ready():
	pass # Replace with function body.

func Enter():
	player = get_tree().get_first_node_in_group("player")
	randomize_wander()
	
func Update(delta: float):
	if wander_time > 0 :
		wander_time -= delta
	else:
		randomize_wander()

func Physics_Update(delta: float):
	if enemy:
		enemy.velocity = move_direction * move_speed
		enemy.rotation = move_direction.normalized().angle() + PI/2
	
	var player_direction = Vector2()
	
	if is_instance_valid(player):
		player_direction =  player.global_position - enemy.global_position
	
	if player_direction.length() < 50:
		Transitioned.emit(self, "EnemyFollowPlayer")

func randomize_wander():
	move_direction = Vector2(randf_range(-1,1), randf_range(-1,1)).normalized()
	wander_time = randf_range(1,3)
