extends Node2D

var seconds := 0.0

func _process(delta: float) -> void:
	var dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if dir == Vector2.ZERO:
		var keys := Vector2.ZERO
		if Input.is_physical_key_pressed(KEY_A):
			keys.x -= 1.0
		if Input.is_physical_key_pressed(KEY_D):
			keys.x += 1.0
		if Input.is_physical_key_pressed(KEY_W):
			keys.y -= 1.0
		if Input.is_physical_key_pressed(KEY_S):
			keys.y += 1.0
		dir = keys
	$Player.position += dir * 240.0 * delta
	$Player.position.x = clampf($Player.position.x, 0.0, 712.0)
	$Player.position.y = clampf($Player.position.y, 130.0, 372.0)
	seconds += delta
	$Counter.text = "Running fine for %d seconds. That's the whole test." % int(seconds)
