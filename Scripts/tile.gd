extends Control

@export var state : String = ""
@onready var anim_sprite = $AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if state == "":
		anim_sprite.play("default")
	if state == "pangui":
		anim_sprite.play("pangui")
	if state == "trewa":
		anim_sprite.play("trewa")
	if state == "null":
		anim_sprite.hide()
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func change_state(state : String):
	if state == "":
		anim_sprite.play("default")
	if state == "pangui":
		anim_sprite.play("pangui")
	if state == "trewa":
		anim_sprite.play("trewa")
	if state == "null":
		anim_sprite.hide()
