extends CanvasLayer


@onready var control = $Control

@onready var control_score = $ControlScore


func _on_fechar_pressed():
	get_node("AnimationPlayer").play("TransOut")
	pass # Replace with function body.





func _on_passaro_pressed():
	get_tree().change_scene_to_file("res://Games/Flappy/Scenes/main.tscn")
	pass # Replace with function body.


func _on_cobrinha_pressed():
	get_tree().change_scene_to_file("res://scenes/Snake.tscn")
	pass # Replace with function body.


func _on_candy_crush_pressed():
	get_tree().change_scene_to_file("res://scenes/Candy.tscn")
	pass # Replace with function body.


func _on_quebra_cabeca_pressed():
	get_tree().change_scene_to_file("res://scenes/Quebra.tscn")
	pass # Replace with function body.


func _on_labirinto_pressed():
	get_tree().change_scene_to_file("res://scenes/Maze.tscn")
	pass # Replace with function body.


func _on_ver_pontuacao_pressed():
	control.visible = !control.visible
	control_score.visible = !control_score.visible
	pass # Replace with function body.
