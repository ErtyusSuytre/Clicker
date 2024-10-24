extends Button

var Game: GameManager
@export var button_name: String = "Button"
var count: int = 0
@export var cost: int = 10
@export var increase: int = 1

func _ready():
	Game = get_tree().get_first_node_in_group("Game")

func _on_pressed():
	if !Game.sub_points(cost):
		return
	Game.add_click_power(increase)
	count += 1
	grow_cost()

func grow_cost():
	cost *= 1.1
