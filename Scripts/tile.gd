extends Control

@export var cell_ID : int
@export var state : String
@export var neighbors : Array[int] #CLOCKWISE
@onready var anim_sprite = $AnimatedSprite2D
@export var is_pressed = "" # "", selected, highlighted
@onready var selection_radius = $button_selection_radius
@onready var selected_radius = $selected_selection_radius
signal selected_tile(is_pressed : String, cell_num : int, cell_state : String)

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
	
func change_state(changed_state : String):
	state = changed_state
	
	if changed_state == "":
		anim_sprite.play("default")
	if changed_state == "pangui":
		anim_sprite.play("pangui")
	if changed_state == "trewa":
		anim_sprite.play("trewa")
	if changed_state == "null":
		anim_sprite.hide()


func _on_button_pressed() -> void:
	if state == "null":
		return
	if is_pressed == "":
		is_pressed = "selected"
		selected_radius.show()
		selected_tile.emit(is_pressed, cell_ID, state)
		print("a")
	elif is_pressed == "selected":
		print('b')
		is_pressed = ""
		selected_radius.hide()
		selected_tile.emit(is_pressed, cell_ID, state)
		
func change_is_pressed_state(changed_is_pressed : String):
	if changed_is_pressed == "highlighted":
		is_pressed = "highlighted"
		selection_radius.show()
	elif changed_is_pressed == "":
		is_pressed = ""
		selection_radius.hide()
		
		
