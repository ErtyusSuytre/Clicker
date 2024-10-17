class_name GameManager
extends Node2D

var points: int = 0
@export var points_counter: RichTextLabel

var click_power = 1

var points_s: int = 0
@export var points_s_counter: RichTextLabel

func _ready():
	points = 0
	points_s = 0
	if points_counter == null || points_s_counter == null:
		get_tree().quit()
		return 1
	_update_points_s_counter()
	_update_counter()

func _process(delta):
	pass

# Click (Point) Updater
func _update_counter():
	points_counter.text = str(points)
	
func set_points(new_points: int) -> bool:
	points = new_points
	_update_counter()
	return true

func add_points(diff_points: int) -> bool:
	set_points(points + diff_points)
	return true

func sub_points(diff_points: int) -> bool:
	if points < diff_points:
		return false
	set_points(points - diff_points)
	return true

func click() -> bool:
	add_points(click_power)
	return true

func set_click_power(new_click_power: int) -> bool:
	click_power = new_click_power
	return true
	
func add_click_power(diff_click_power: int) -> bool:
	set_points(click_power + diff_click_power)
	return true

func sub_click_power(diff_click_power: int) -> bool:
	set_points(click_power - diff_click_power)
	return true


# Idle Point Updater
func _update_points_s_counter():
	points_s_counter.text = str(points_s)
	
func set_points_s(new_points_s: int) -> bool:
	points_s = new_points_s
	_update_points_s_counter()
	return true

func add_points_s(diff_points_s: int) -> bool:
	set_points_s(points_s + diff_points_s)
	return true

func sub_points_s(diff_points_s: int) -> bool:
	if points_s < diff_points_s:
		return false
	set_points_s(points_s - diff_points_s)
	return true
