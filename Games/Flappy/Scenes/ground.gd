extends Node2D

class_name Ground

signal bird_crashed

@export var speed = -150
@onready var sprites = [
	$Ground1/Sprite2D, $Ground2/Sprite2D, $Ground3/Sprite2D, 
	$Ground4/Sprite2D, $Ground5/Sprite2D, $Ground6/Sprite2D, 
	$Ground7/Sprite2D, $Ground8/Sprite2D, $Ground9/Sprite2D,
	$Ground10/Sprite2D, $Ground11/Sprite2D, $Ground12/Sprite2D
]

@export var camera_width = 1920  # Largura da câmera
@export var camera_half_width = camera_width / 2  # Metade da largura da câmera (960)

func _ready():
	# Posiciona o primeiro sprite no ponto (-960, 0), para alinhar com o início da tela
	sprites[0].global_position.x = -camera_half_width
	
	# Posiciona os demais sprites consecutivamente na horizontal
	for i in range(1, sprites.size()):
		sprites[i].global_position.x = sprites[i - 1].global_position.x + sprites[i - 1].texture.get_width()

func _process(delta):
	for sprite in sprites:
		# Move cada sprite
		sprite.global_position.x += speed * delta
		
		# Se o sprite sair completamente da tela (leva em conta a câmera e a largura do sprite)
		if sprite.global_position.x < -camera_half_width - sprite.texture.get_width():
			# Calcula a posição final do último sprite
			var last_sprite = sprites[sprites.size() - 1]
			sprite.global_position.x = last_sprite.global_position.x + last_sprite.texture.get_width()
			
			# Reordena os sprites, movendo o sprite reposicionado para o final da lista
			sprites.push_back(sprites.pop_front())


func _on_ground_body_entered(body):
	bird_crashed.emit()
	stop()
	(body as Bird).stop()
	pass # Replace with function body.


func stop():
	speed = 0
