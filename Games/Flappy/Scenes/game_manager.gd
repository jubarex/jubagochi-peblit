extends Node


@onready var bird = $"../Bird" as Bird
@onready var pipe_spawner = $"../PipeSpawner" as PipeSpawner
@onready var ground = $"../Ground" as Ground
@onready var fade = $"../Fade" as Fade
@onready var ui = $"../UI" as UI

@onready var som_morte = $"../SomMorte"
@onready var som_ponto = $"../SomPonto"


@onready var soundtrack_principal = $"../SoundtrackPrincipal"


var points = 0

func _ready():
	bird.game_started.connect(on_game_started)
	ground.bird_crashed.connect(end_game)
	pipe_spawner.bird_crashed.connect(end_game)
	pipe_spawner.point_scored.connect(on_point_scored)
	soundtrack_principal.play()
	
	
func on_game_started():
	pipe_spawner.start_spawning_pipes()
	pass	

func end_game():
	if fade != null:	
		Global.gold += points
		som_morte.play()
		fade.play()
	soundtrack_principal.stop()
	ground.stop()
	bird.kill()
	pipe_spawner.stop()
	ui.on_game_over()

	pass

func on_point_scored():
	points += 1
	som_ponto.play()
	ui.update_points(points)


func _on_ui_sair():
	get_tree().change_scene_to_file("res://menu2.tscn")
	pass # Replace with function body.
