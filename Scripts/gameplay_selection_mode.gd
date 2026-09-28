extends Control


func _on_v_1_button_pressed() -> void:
	Global.player_mode = 0
	if Global.game_mode == 0: #RANDOM
		get_tree().change_scene_to_file("res://Scenes/game_scene.tscn")
	if Global.game_mode == 1: #MANUAL
		get_tree().change_scene_to_file("res://Scenes/selection_mode_transition.tscn")


func _on_vs_bot_button_pressed() -> void:
	Global.player_mode = 1
	if Global.game_mode == 0: #RANDOM
		get_tree().change_scene_to_file("res://Scenes/game_scene.tscn")
	if Global.game_mode == 1: #MANUAL
		get_tree().change_scene_to_file("res://Scenes/selection_mode_transition.tscn")


func _on_online_button_pressed() -> void:
	#NOT READY YET (will transport to a new scene)
	pass
