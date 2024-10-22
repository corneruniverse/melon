extends CharacterBody2D
#@export var melon_scene : PackedScene
var melon_scene = preload("res://Scenes/melon.tscn")
var speed = 400  # move speed in pixels/sec
var target = null
var axis_x = null

# the character moves to the clicked location.
# reference: https://kidscancode.org/godot_recipes/4.x/2d/topdown_movement/index.html
func _input(event):
	if event.is_action_pressed("click"):
		axis_x = get_global_mouse_position().x
		target = Vector2(axis_x, 130)

func _physics_process(delta):
	if target:
		# look_at(target)
		velocity = position.direction_to(target) * speed
		if position.distance_to(target) < 10:
			velocity = Vector2.ZERO
	move_and_slide()

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
	#if Input.is_action_just_pressed("ui_down") or Input.is_action_just_pressed("drop"):
	if Input.is_action_just_pressed("drop"):
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
