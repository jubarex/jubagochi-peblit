extends Area2D

@export var speed : float = 100

@export var joystick_left : VirtualJoystick

@export var joystick_right : VirtualJoystick

var move_vector := Vector2.ZERO

signal pegou_estrela

func _process(delta: float) -> void:
	## Movement using the joystick output:
#	if joystick_left and joystick_left.is_pressed:
#		position += joystick_left.output * speed * delta
	
	## Movement using Input functions:
	move_vector = Vector2.ZERO
	move_vector = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	position += move_vector * speed * delta
	
	# Rotation:
	if joystick_right and joystick_right.is_pressed:
		rotation = joystick_right.output.angle()


func _on_area_entered(area: Area2D) -> void:
	print(area)
	if area.is_in_group("Star"):
		pegou_estrela.emit()
		area.queue_free()  # Remove a estrela da tela
		print("Estrela coletada!")
	pass # Replace with function body.
