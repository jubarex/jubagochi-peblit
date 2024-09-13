extends Node

var save_path = "user://variable.save"

@onready var label_1 = $"../Label1"
@onready var label_2 = $"../Label2"
@onready var label_3 = $"../Label3"
@onready var gold: Label = $"../Gold"
@onready var gold_pd: Label = $"../GoldPD"


var var1 = 0
var var2 = 0
var var3 = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	load_data()
#	%d e depois % é igual a colocar paramêtros
	#label_1.text = "%d" % var1
	#label_2.text = "%d" % var2
	#label_3.text = "%d" % var3
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	label_1.text = "%d" % var1
	label_2.text = str(var2)
	label_3.text = "%d" % var3
	#gold.text = "%d" % Global.gold
	gold_pd.text = "%d" % Global.playerData.gold
	pass


func _on_load_pressed():
	load_data()
	Global.load_data()
	gold_pd.text = "%d" % Global.playerData.gold
	pass # Replace with function body.



func _on_save_pressed():
	Global.save()
	save()
	#playerData.addScoreFlappy("25 - 11/09/2024")
	pass # Replace with function body.


func _on_plus1_pressed():
	var1 += 1
	Global.playerData.addGold(3)
	pass # Replace with function body.


func _on_minus1_pressed():
	var1 -= 1
	Global.playerData.addGold(-3)
	pass # Replace with function body.


func _on_plus2_pressed():
	var2 += 1
	pass # Replace with function body.


func _on_minus2_pressed():
	var2 -= 1
	pass # Replace with function body.


func _on_plus3_pressed():
	var3 += 1
	pass # Replace with function body.


func _on_minus3_pressed():
	get_tree().change_scene_to_file("res://menu2.tscn")
	#var3 -= 1
	pass # Replace with function body.



func save():
	pass
	#var file = FileAccess.open(save_path, FileAccess.WRITE)
	#file.store_var(var1)
	#file.store_var(var2)
	#file.store_var(var3)
	#file.close()
		
		
func load_data():
	pass
	#if FileAccess.file_exists(save_path):
		#var file = FileAccess.open(save_path, FileAccess.READ)
		#var1 = file.get_var(var1)
		#var2 = file.get_var(var2)
		#var3 = file.get_var(var3)
	#else:
		#print("no data saved..")
		#var1 = 0
		#var2 = 0
		#var3 = 0
	
