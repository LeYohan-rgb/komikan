extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_initial_board_state()
	connect_all_signals("selected_tile", pressed_tile)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func load_initial_board_state():
	#GET RID OF NON-TILES
	get_node("game_scene_layout/board_layout/triangle_board/row_2/tile").change_state("null")
	get_node("game_scene_layout/board_layout/triangle_board/row_6/tile").change_state("null")
	
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

func connect_all_signals(my_signal : String, callable_signal : Callable):
	#TRIANGULAR
	get_node("game_scene_layout/board_layout/triangle_board/row_1/tile26").connect(my_signal, callable_signal)
	get_node("game_scene_layout/board_layout/triangle_board/row_2/tile31").connect(my_signal, callable_signal)
	get_node("game_scene_layout/board_layout/triangle_board/row_3/tile27").connect(my_signal, callable_signal)
	get_node("game_scene_layout/board_layout/triangle_board/row_3/tile32").connect(my_signal, callable_signal)
	get_node("game_scene_layout/board_layout/triangle_board/row_3/tile36").connect(my_signal, callable_signal)
	get_node("game_scene_layout/board_layout/triangle_board/row_4/tile28").connect(my_signal, callable_signal)
	get_node("game_scene_layout/board_layout/triangle_board/row_4/tile33").connect(my_signal, callable_signal)
	get_node("game_scene_layout/board_layout/triangle_board/row_4/tile37").connect(my_signal, callable_signal)
	get_node("game_scene_layout/board_layout/triangle_board/row_5/tile29").connect(my_signal, callable_signal)
	get_node("game_scene_layout/board_layout/triangle_board/row_5/tile34").connect(my_signal, callable_signal)
	get_node("game_scene_layout/board_layout/triangle_board/row_5/tile38").connect(my_signal, callable_signal)
	get_node("game_scene_layout/board_layout/triangle_board/row_6/tile35").connect(my_signal, callable_signal)
	get_node("game_scene_layout/board_layout/triangle_board/row_7/tile30").connect(my_signal, callable_signal)

	#SQUARE
	for i in range(25):
		get_node("game_scene_layout/board_layout/big_square_board/tile"+str(i+1)).connect(my_signal, callable_signal)
		
func pressed_tile(is_pressed : String, cell_num : int):
	print("selected!", is_pressed, cell_num)
