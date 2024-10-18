extends CharacterBody2D
const SPEED = 300.0

func _physics_process(delta: float) -> void:
	#position += transform.x * SPEED * delta
	var fall = false
	var perm_direction_y = 0
	var direction_y = 1
	if direction_y > 0:
		perm_direction_y = direction_y
		fall = true
	if fall:
		velocity.y = perm_direction_y * SPEED
	move_and_slide()
