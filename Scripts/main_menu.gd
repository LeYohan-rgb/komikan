extends Control

@onready var settings_panel = $Center_setting/settings_panel
@onready var settings_panel_centered = $Center_setting


func _ready() -> void:
	var viewport_size = get_viewport().get_visible_rect().size

	settings_panel.custom_minimum_size.y = viewport_size.y * (1200.0 / 1920.0)
	settings_panel.custom_minimum_size.x = viewport_size.x * (800.0 / 1080.0)
	
func _on_settings_button_pressed() -> void:
	settings_panel_centered.show()


func _on_button_pressed() -> void:
	settings_panel_centered.hide()


func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/gameplay_selection_mode.tscn")


func _on_player_1_name_text_changed(new_text: String) -> void:
	Global.player_name_1 = new_text


func _on_player_2_name_text_changed(new_text: String) -> void:
	Global.player_name_2 = new_text
