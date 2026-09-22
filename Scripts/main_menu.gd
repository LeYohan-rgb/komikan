extends Control

@onready var settings_panel = $CenterContainer/settings_panel


func _ready() -> void:
	var viewport_size = get_viewport().get_visible_rect().size

	settings_panel.custom_minimum_size.y = viewport_size.y * 0.625
	settings_panel.custom_minimum_size.x = viewport_size.x * (800.0 / 1080.0)
	
func _on_settings_button_pressed() -> void:
	pass # Replace with function body.
