extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.game_mode == 0:
		pass
		#do random
	if Global.game_mode == 1:
		pass
		#do manual


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
