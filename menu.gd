extends Control

@onready var http_request_agua = $MarginContainer/VBoxContainer/MarginContainer/DarAguaButton/HTTPRequest
const URL = "https://v2.jokeapi.dev/joke/dark"
const carregando = "Carregando.."
var texto = ""

const botaoAgua = "MarginContainer/VBoxContainer/MarginContainer/DarAguaButton"

# Called when the node enters the scene tree for the first time.
func _ready():
	$MarginContainer/VBoxContainer/MarginContainer/DarAguaButton .grab_focus() 
	

func clicarBotao():
	$audioBotao.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass 


func _on_start_button_pressed():
	clicarBotao()
	#get_tree().change_scene_to_file("res://planta.tscn")
	get_node("RichTextLabel").set_text("Carregando..")
	get_node(botaoAgua).disabled = true
	http_request_agua.request(URL)
	
	pass


func _on_options_button_pressed():
	clicarBotao()
	pass


func _on_ligar_button_pressed():
	clicarBotao()
	pass # Replace with function body.


func _on_tocar_som_button_pressed():
	clicarBotao()
	$Clicado.play()
	pass # Replace with function body.


func _on_quit_button_pressed():
	clicarBotao()
	get_tree().quit()


func _on_http_request_request_completed(result, response_code, headers, body):
	clicarBotao()
	var resposta = JSON.parse_string(body.get_string_from_utf8())
	if resposta['type'] != 'single':
		get_node("RichTextLabel").set_text(resposta['setup'])
		get_node("RichTextLabel").newline()
		await get_tree().create_timer(5).timeout
		get_node("RichTextLabel").add_text(resposta['delivery'])
		get_node(botaoAgua).disabled = false
	else:
		get_node("RichTextLabel").set_text("Tente Novamente")
		get_node(botaoAgua).disabled = false
		
	
