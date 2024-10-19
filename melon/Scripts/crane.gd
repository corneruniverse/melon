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
	
#func _unhandled_input(event):
	## if the user taps the screen (on their smartphone)
	## reference: https://docs.godotengine.org/en/stable/tutorials/inputs/inputevent.html
	## reference: https://forum.godotengine.org/t/which-is-the-best-way-to-handle-touch-screen-controls-and-clicking-objects/42209
	#if event is InputEventKey:
		#if event.pressed:
			#get_input(event)
	
func get_input():
	# rotate the crane
	# removed in order to simplify and stabilize mobile app version
	#look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("ui_down") or Input.is_action_just_pressed("drop"):
		drop()
		
	## if the touch screen was used	
	#if (event is InputEventScreenTouch):
		## if the touch screen was pressed
		#if (event.pressed()):
			#drop()

func drop():
	var m = melon_scene.instantiate()
	get_tree().root.add_child(m)
	m.transform = $Muzzle.global_transform
