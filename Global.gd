extends Node

var save_file_path ="user://save/"
var save_file_name = "PlayerSave.tres"
var playerData = PlayerData.new()


var items = {
	0: {
		"Name": "Maçã",
		"Des": "Roupa 1: Vermelha",
		"Cost": 5,
		"Cat": 1
	},
	1: {
		"Name": "Laranja",
		"Des": "Roupa e é uma laranja!",
		"Cost": 5,
		"Cat": 1
	},
	2: {
		"Name": "Banana",
		"Des": "Fundo que é banana!",
		"Cost": 5,
		"Cat": 2
	}
}


var inventory = {
	0: {
		"Name": "Maçã",
		"Des": "Isso é uma maçã vermelha!",
		"Cost": 5,
		"Count": 1
	}
}



func _process(delta):
	if Input.is_action_just_pressed("save"):
		save()
	if Input.is_action_just_pressed("load"):
		load_data()

func _ready():
	verify_save_directory(save_file_path)
	load_data()

	
func on_start_load():
	#self.gold = playerData.gold
	pass
	

func verify_save_directory(path: String):
	DirAccess.make_dir_absolute(path)
	

func load_data():
	playerData = ResourceLoader.load(save_file_path + save_file_name).duplicate(true)
	on_start_load()
	print("loaded")
	
func save():
	ResourceSaver.save(playerData, save_file_path + save_file_name)
	print("save")
	
	
