# Main.gd
extends Node2D

@export var ScoreEstrela = 0

@export var star_scene: PackedScene  = preload("res://scenes/star.tscn")
@export var spawn_region: Rect2  # Defina a área de spawn das estrelas no editor
@onready var player: Area2D = $"../Player"
@onready var score: Label = $"../Score"

@onready var audio_estrela: AudioStreamPlayer = $"../AudioEstrela"
@onready var audio_pegar_estrela: AudioStreamPlayer = $"../AudioPegarEstrela"
@onready var audio_trilha_sonora: AudioStreamPlayer = $"../AudioTrilhaSonora"

func _ready():
	audio_trilha_sonora.play()
	score.text = "0"
	player.pegou_estrela.connect(_on_star_collected)
	# Exemplo: Gera estrelas ao iniciar
	for i in range(10):
		spawn_star()
		
func getScoreEstrela():
	return int(ScoreEstrela)

func spawn_star():
	var star = star_scene.instantiate()
	var random_position = Vector2(
		randf_range(spawn_region.position.x, spawn_region.position.x + spawn_region.size.x),
		randf_range(spawn_region.position.y, spawn_region.position.y + spawn_region.size.y)
	)
	star.position = random_position
	star.connect("collected",_on_star_collected)
	add_child(star)
	
func spawn_star_com_som():
	audio_estrela.play()
	var star = star_scene.instantiate()
	var random_position = Vector2(
		randf_range(spawn_region.position.x, spawn_region.position.x + spawn_region.size.x),
		randf_range(spawn_region.position.y, spawn_region.position.y + spawn_region.size.y)
	)
	star.position = random_position
	star.connect("collected",_on_star_collected)
	add_child(star)

func _on_star_collected():
	audio_pegar_estrela.play()
	ScoreEstrela += 1
	score.text = "" + str(ScoreEstrela)
	# Lógica ao coletar uma estrela (ex: aumentar a pontuação)
	spawn_star_com_som()
	print("Estrela coletada!")
