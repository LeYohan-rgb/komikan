extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_initial_board_state()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func load_initial_board_state():
	#PANGUI
	change_tile_state(33, "pangui", true, 4)
	
	#TREWAS
	change_tile_state(11, "trewa")
	change_tile_state(15, "trewa")

	for i in range(15, 25):
		change_tile_state(i+1, "trewa")

func change_tile_state(tile_num : int, state : String, square_or_triangle : bool = false, triangle_row : int = 0):
	if square_or_triangle:
		get_node("game_scene_layout/board_layout/triangle_board/row_" + str(triangle_row) + "/tile" + str(tile_num)).change_state(state)
	else:
		get_node("game_scene_layout/board_layout/big_square_board/tile"+str(tile_num)).change_state(state)
