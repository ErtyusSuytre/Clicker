extends Button

var Game: GameManager
@export var button_name: String = "Button"
@export var cost: int = 0

func _ready():
	Game = get_tree().get_first_node_in_group("Game")
	# Replace text with name and cost and click and stuff
	pass

func _on_pressed():
	Game.click()
