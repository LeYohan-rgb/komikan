extends Control

var cell_ID_to_node : Dictionary
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cell_ID_to_node = {
	1: get_node("game_scene_layout/board_layout/big_square_board/tile1"),
	2: get_node("game_scene_layout/board_layout/big_square_board/tile2"),
	3: get_node("game_scene_layout/board_layout/big_square_board/tile3"),
	4: get_node("game_scene_layout/board_layout/big_square_board/tile4"),
	5: get_node("game_scene_layout/board_layout/big_square_board/tile5"),
	6: get_node("game_scene_layout/board_layout/big_square_board/tile6"),
	7: get_node("game_scene_layout/board_layout/big_square_board/tile7"),
	8: get_node("game_scene_layout/board_layout/big_square_board/tile8"),
	9: get_node("game_scene_layout/board_layout/big_square_board/tile9"),
	10: get_node("game_scene_layout/board_layout/big_square_board/tile10"),
	11: get_node("game_scene_layout/board_layout/big_square_board/tile11"),
	12: get_node("game_scene_layout/board_layout/big_square_board/tile12"),
	13: get_node("game_scene_layout/board_layout/big_square_board/tile13"),
	14: get_node("game_scene_layout/board_layout/big_square_board/tile14"),
	15: get_node("game_scene_layout/board_layout/big_square_board/tile15"),
	16: get_node("game_scene_layout/board_layout/big_square_board/tile16"),
	17: get_node("game_scene_layout/board_layout/big_square_board/tile17"),
	18: get_node("game_scene_layout/board_layout/big_square_board/tile18"),
	19: get_node("game_scene_layout/board_layout/big_square_board/tile19"),
	20: get_node("game_scene_layout/board_layout/big_square_board/tile20"),
	21: get_node("game_scene_layout/board_layout/big_square_board/tile21"),
	22: get_node("game_scene_layout/board_layout/big_square_board/tile22"),
	23: get_node("game_scene_layout/board_layout/big_square_board/tile23"),
	24: get_node("game_scene_layout/board_layout/big_square_board/tile24"),
	25: get_node("game_scene_layout/board_layout/big_square_board/tile25"),
	26: get_node("game_scene_layout/board_layout/triangle_board/row_1/tile26"),
	27: get_node("game_scene_layout/board_layout/triangle_board/row_3/tile27"),
	28: get_node("game_scene_layout/board_layout/triangle_board/row_4/tile28"),
	29: get_node("game_scene_layout/board_layout/triangle_board/row_5/tile29"),
	30: get_node("game_scene_layout/board_layout/triangle_board/row_7/tile30"),
	31: get_node("game_scene_layout/board_layout/triangle_board/row_2/tile31"),
	32: get_node("game_scene_layout/board_layout/triangle_board/row_3/tile32"),
	33: get_node("game_scene_layout/board_layout/triangle_board/row_4/tile33"),
	34: get_node("game_scene_layout/board_layout/triangle_board/row_5/tile34"),
	35: get_node("game_scene_layout/board_layout/triangle_board/row_6/tile35"),
	36: get_node("game_scene_layout/board_layout/triangle_board/row_3/tile36"),
	37: get_node("game_scene_layout/board_layout/triangle_board/row_4/tile37"),
	38: get_node("game_scene_layout/board_layout/triangle_board/row_5/tile38")
	}
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
		
func pressed_tile(is_pressed : String, cell_num : int, cell_state : String):
	if cell_state == "":
		return
		
	if is_pressed == "": #DESELECT
		#NO CELL NOW
		Global.selected_cell = 0
		for i in cell_ID_to_node[cell_num].neighbors:
			if cell_ID_to_node[i].state == "":
				cell_ID_to_node[i].change_is_pressed_state("")
	elif is_pressed == "selected": #SELECT
		#declare the globally selected cell
		if Global.selected_cell == 0:
			Global.selected_cell = cell_num
		else: #ALREADY A SELECTED CELL
			deselect_cell(Global.selected_cell) #UNSELECT THE PREVIOUS CELL
			Global.selected_cell = cell_num #DECLARE NEW SELECTED CELL AS SELECTED
				
		for i in cell_ID_to_node[cell_num].neighbors:
			if cell_ID_to_node[i].state == "":
				cell_ID_to_node[i].change_is_pressed_state("highlighted")

func deselect_cell(cell_num : int):
		cell_ID_to_node[cell_num].change_is_pressed_state("")
		for i in cell_ID_to_node[cell_num].neighbors:
			if cell_ID_to_node[i].state == "":
				cell_ID_to_node[i].change_is_pressed_state("")
