extends Button

var Game: GameManager
@export var button_name: String = "Button"
var count: int = 0
@export var cost: int = 10
@export var points_s: int = 1
@export var timer: float = 1.0
var total_points_s: int = 0

func _ready():
	Game = get_tree().get_first_node_in_group("Game")
	$Timer.wait_time = timer
	total_points_s = 0

func _on_pressed():
	if !Game.sub_points(cost):
		return
	if $Timer.is_stopped():
		$Timer.start()
	Game.add_points_s(points_s)
	count += 1
	grow_cost()
	total_points_s += points_s

func _on_timer_timeout():
	Game.add_points(total_points_s)

func grow_cost():
	cost *= 1.1
