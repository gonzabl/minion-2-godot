extends KinematicBody2D

const FLOOR_NORMAL = Vector2.UP

var speed = 300
var jump_speed = -350
var gravity = 2000

var velocity = Vector2()

func get_input():
	velocity.x = 0
	if Input.is_action_pressed("left"):
		velocity.x -= speed
	if Input.is_action_pressed("right"):
		velocity.x += speed
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_speed
	
	
func _physics_process(delta):
	velocity.y += gravity * delta
	get_input()
	velocity = move_and_slide(velocity,FLOOR_NORMAL)
	
func dead():
	queue_free()

func aplicar_telequinesis(pos):
	if Input.is_action_just_pressed("realease"):
		var dir = pos - position
		pass

func _on_Area2D_body_entered(body):
	queue_free()
