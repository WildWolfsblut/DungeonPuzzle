class_name Player
extends CharacterBody2D

const TILE_SIZE: int = 32

@export var grid_position: Vector2i = Vector2i(3, 3)
@onready var ground: TileMapLayer = get_parent().get_node("Level/Ground") as TileMapLayer


func _ready() -> void:
	position = Vector2(grid_position * TILE_SIZE) + Vector2(TILE_SIZE, TILE_SIZE) / 2.0


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
	var target_position: Vector2i = grid_position + direction

	if _is_walkable(target_position):
		grid_position = target_position
		position = Vector2(grid_position * TILE_SIZE) + Vector2(TILE_SIZE, TILE_SIZE) / 2.0


func _is_walkable(target_position: Vector2i) -> bool:
	var tile_data: TileData = ground.get_cell_tile_data(target_position)

	if tile_data == null:
		return false

	return not tile_data.get_collision_polygons_count(0) > 0
