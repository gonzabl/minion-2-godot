extends RigidBody2D

enum {NORMAL,SELECCIONADO, LEVITANDO}
var estado = NORMAL
var pos

func _integrate_forces(state):
	
	
	if Input.is_action_just_pressed("select"):
		estado = LEVITANDO
	if Input.is_action_just_pressed("realease"):
		estado = NORMAL
	
	match estado:
		NORMAL:
			linear_velocity = Vector2.ZERO
		SELECCIONADO:
			pass
		LEVITANDO:
			linear_velocity = Vector2(0,-50)
			



func _on_Caja_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and Input.is_action_just_pressed("click"):
		pos = get_global_transform().get_origin()
		var otro = position
		print (pos)
		print ("con position: " + otro as String)	
