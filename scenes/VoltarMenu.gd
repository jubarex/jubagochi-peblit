extends Button

@onready var bg: Sprite2D = $"../BG"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed_voltar_menu():
	if is_instance_valid(bg):
		print(str(bg.getScoreEstrela()))
		Global.playerData.addScoreEstrela(bg.getScoreEstrela())
		Global.playerData.addGold(bg.getScoreEstrela())
		Global.save()
	await get_tree().create_timer(2).timeout
	get_tree().change_scene_to_file("res://menu2.tscn")
	pass # Replace with function body.
