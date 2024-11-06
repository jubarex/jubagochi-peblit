# Star.gd
extends Area2D

signal collected

func _ready():
	# Adicione qualquer configuração inicial, como animações de brilho
	pass

func _on_body_entered(body):
	print(body)
	if body.name == "Player":
		emit_signal("collected")
		queue_free()  # Remove a estrela da tela quando coletada
