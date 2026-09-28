extends Control


func _on_v_1_button_pressed() -> void:
	Global.player_mode = 0 # player vs player
	if Global.game_mode == 0: #RANDOM
		Global.pangui_player_mode = randi_range(0, 1)
		get_tree().change_scene_to_file("res://Scenes/game_scene.tscn")
	if Global.game_mode == 1: #MANUAL
		get_tree().change_scene_to_file("res://Scenes/selection_mode_transition.tscn")


func _on_vs_bot_button_pressed() -> void:
	Global.player_mode = 1 #player vs bot
	if Global.game_mode == 0: #RANDOM
		Global.pangui_bot_mode = randi_range(0, 1)
		get_tree().change_scene_to_file("res://Scenes/game_scene.tscn")
	if Global.game_mode == 1: #MANUAL
		get_tree().change_scene_to_file("res://Scenes/selection_mode_transition.tscn")


func _on_online_button_pressed() -> void:
	#NOT READY YET (will transport to a new scene)
	pass
