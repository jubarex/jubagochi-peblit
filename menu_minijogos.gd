extends CanvasLayer


@onready var control = $Control

@onready var control_score = $ControlScore

@onready var audio_erro: AudioStreamPlayer = $AudioErro
@onready var audio_sucesso: AudioStreamPlayer = $AudioSucesso
@onready var audio_normal: AudioStreamPlayer = $AudioNormal



func _on_fechar_pressed():
	audio_normal.play()
	get_node("AnimationPlayer").play("TransOut")
	pass # Replace with function body.


func _ready():
	mostrarScoreFlappy()


func _on_passaro_pressed():
	audio_sucesso.play()
	get_tree().change_scene_to_file("res://Games/Flappy/Scenes/main.tscn")
	pass # Replace with function body.


func _on_cobrinha_pressed():
	audio_sucesso.play()
	get_tree().change_scene_to_file("res://resources/testando.tscn")
	pass # Replace with function body.


func _on_candy_crush_pressed():
	audio_sucesso.play()
	get_tree().change_scene_to_file("res://scenes/Candy.tscn")
	pass # Replace with function body.


func _on_quebra_cabeca_pressed():
	audio_sucesso.play()
	get_tree().change_scene_to_file("res://scenes/Quebra.tscn")
	pass # Replace with function body.


func _on_labirinto_pressed():
	audio_sucesso.play()
	get_tree().change_scene_to_file("res://scenes/Maze.tscn")
	pass # Replace with function body.


func _on_ver_pontuacao_pressed():
	audio_erro.play()
	control.visible = !control.visible
	control_score.visible = !control_score.visible
	pass # Replace with function body.

@onready var v_box_passaro: VBoxContainer = $ControlScore/HBoxContainer/VBoxPassaro


func mostrarScoreFlappy():
	for i in Global.playerData.ScoresFlappy.size():
		var score = Global.playerData.ScoresFlappy[i]
		var scoreLabel: Label = Label.new() 
		#scoreLabel.
		scoreLabel.text = str(i+1) + ". " + str(score) +" pontos"
		scoreLabel.add_theme_font_size_override("font_size", 38)  
		v_box_passaro.add_child(scoreLabel)
		
