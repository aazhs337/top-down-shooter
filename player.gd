extends CharacterBody2D

const SPEED = 300.0
var bullet_scene = preload("res://Bullet.tscn")

func _physics_process(delta):
	var dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = dir * SPEED
	look_at(get_global_mouse_position())
	move_and_slide()

func _unhandled_input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		shoot()

func shoot():
	var bullet = bullet_scene.instantiate()
	bullet.global_position = global_position
	bullet.global_rotation = global_rotation
	get_tree().current_scene.add_child(bullet)
