extends Control

@onready var player_name_options = $HBoxContainer/VBoxContainer/buttons_list/VBoxContainer/HBoxContainer/player_names_options

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.player_mode == 0: #if its player vs player
		Global.pangui_player_mode = 0
		player_name_options.set_item_text(0, Global.player_name_1)
		player_name_options.set_item_text(1, Global.player_name_2)
		
	if Global.player_mode == 1: #if its player vs bot
		Global.pangui_bot_mode = 0
		player_name_options.set_item_text(0, Global.player_name_1)
		player_name_options.set_item_text(1, "Bot")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_player_names_options_item_selected(index: int) -> void:
	if Global.player_mode == 0: #pvp
		Global.pangui_player_mode = index
		
	if Global.player_mode == 1: #if its player vs bot
		Global.pangui_bot_mode = index


func _on_start_game_bttn_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/game_scene.tscn")
