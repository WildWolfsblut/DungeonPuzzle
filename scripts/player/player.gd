class_name Player
extends CharacterBody2D

const TILE_SIZE: int = 32

var grid_position: Vector2i = Vector2i.ZERO


func _ready() -> void:
	position = Vector2(grid_position * TILE_SIZE)


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("move_up"):
		_move(Vector2i.UP)
	elif event.is_action_pressed("move_down"):
		_move(Vector2i.DOWN)
	elif event.is_action_pressed("move_left"):
		_move(Vector2i.LEFT)
	elif event.is_action_pressed("move_right"):
		_move(Vector2i.RIGHT)


func _move(direction: Vector2i) -> void:
	grid_position += direction
	position = Vector2(grid_position * TILE_SIZE)
