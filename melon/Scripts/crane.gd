extends Node2D
#@export var melon_scene : PackedScene
var melon_scene = preload("res://Scenes/melon.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	get_input()
	pass
	
func get_input():
	look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("ui_down"):
		drop()

func drop():
	var m = melon_scene.instantiate()
	get_tree().root.add_child(m)
	m.transform = $Muzzle.global_transform
