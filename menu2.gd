extends Control

@onready var http_request_agua = $VBoxContainer/HBoxContainer/BaldeButton/HTTPRequest
const URL = "https://v2.jokeapi.dev/joke/dark"
const carregando = "Carregando.."
var texto = ""
var textoNode = "VBoxContainer/TextoInfo"

const botaoAgua = "VBoxContainer/HBoxContainer/BaldeButton"

const URLVitor = "https://peblit.azurewebsites.net/ListarParametrosPorID?id=6"

@onready var audioZhonyas = $AudioZhonyas
@onready var audioLove = $AudioLove
@onready var audioInstinct = $AudioInstinct
@onready var audioBlue = $AudioBlue

@onready var redstone_on_button = $VBoxContainer/HBoxContainer/RedstoneOnButton
@onready var redstone_off_button = $VBoxContainer/HBoxContainer/RedstoneOffButton

@onready var audio_click = $AudioClick
@onready var texture_button = $VBoxContainer/MarginContainer/TextureButton

var rng = RandomNumberGenerator.new()
	
@onready var http_request_vitor = $VBoxContainer/HBoxContainer/BaldeButton/HTTPRequestVitor


const user_mail = ""
const user_pwd = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/HBoxContainer/BaldeButton.grab_focus() 
	#Supabase.auth.connect("signed_in", Callable(self, "_on_signed_in"))
	#Supabase.auth.connect("sign_in_failed", Callable(self, "_on_sign_in_failed"))
	#sign_in()
	requestVitor()
	
	




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass 


func _on_http_request_request_completed(result, response_code, headers, body):
	get_node(textoNode).set_text("Carregando..")
	var resposta = JSON.parse_string(body.get_string_from_utf8())
	if resposta['type'] != 'single':
		get_node(textoNode).set_text(resposta['setup'])
		get_node(textoNode).newline()
		await get_tree().create_timer(5).timeout
		get_node(textoNode).add_text(resposta['delivery'])
		get_node(botaoAgua).disabled = false
	else:
		get_node(textoNode).set_text("Tente Novamente")
		get_node(botaoAgua).disabled = false
		
	
func requestVitor():
	texture_button.disabled = true
	http_request_vitor.request(URLVitor)

func _on_balde_button_pressed():
	audioZhonyas.play()
	#get_tree().change_scene_to_file("res://planta.tscn")
	get_node(botaoAgua).disabled = true
	http_request_agua.request(URL)
	http_request_vitor.request(URLVitor)
	pass

func _on_coracao_button_pressed():
	audioLove.play()
	pass # Replace with function body.


func _on_microfone_button_pressed():
	audioInstinct.play()
	get_node('Shop').visible = true
	get_node('Shop/AnimationPlayer').play('TransIn')
	pass # Replace with function body.


func _on_redstone_on_button_pressed():
	audio_click.play()
	var numAleatorio = rng.randf_range(0, 100.0)
	if(numAleatorio >= 80):
		audioBlue.play()
		await get_tree().create_timer(2).timeout
		get_tree().quit()
	else:
		redstone_off_button.visible = true
		redstone_on_button.visible = false
	pass # Replace with function body.


func _on_redstone_off_button_pressed():
	audio_click.play()
	redstone_off_button.visible = false
	redstone_on_button.visible = true
	pass # Replace with function body.
	
	
	
	





	





@onready var label_id_planta = $VBoxContainer/MarginContainer2/TextureRect/HBoxContainer/id_planta/LabelIdPlanta
@onready var label_temperatura = $VBoxContainer/MarginContainer2/TextureRect/HBoxContainer/temperatura/LabelTemperatura
@onready var label_umidade = $VBoxContainer/MarginContainer2/TextureRect/HBoxContainer/umidade/LabelUmidade
@onready var label_umidade_solo = $VBoxContainer/MarginContainer2/TextureRect/HBoxContainer/umidade_solo/LabelUmidadeSolo
@onready var label_luminosidade = $VBoxContainer/MarginContainer2/TextureRect/HBoxContainer/luminosidade/LabelLuminosidade
@onready var label_pontos = $VBoxContainer/MarginContainer2/TextureRect/HBoxContainer/pontos/LabelPontos
@onready var label_fundo = $VBoxContainer/MarginContainer2/TextureRect/HBoxContainer/fundo/LabelFundo
@onready var label_roupa = $VBoxContainer/MarginContainer2/TextureRect/HBoxContainer/roupa/LabelRoupa




func _on_selected(result : Array): 
	#print(result)
	label_id_planta.text = "" + str(result[0].id_planta) 
	label_temperatura.text = "" + str(result[0].temperatura) + "º" 
	label_umidade.text = "" + str(result[0].umidade) + "%"  
	label_umidade_solo.text = "" + str(result[0].umidade_solo) + "%" 
	label_luminosidade.text = "" + str(result[0].luminosidade) + "%" 
	label_pontos.text = "R$" + str(result[0].pontos) + "" 
	label_fundo.text = "" + str(result[0].id_fundo_atual) + "" 
	label_roupa.text = "" + str(result[0].id_roupa_atual) + "" 
	Global.gold = result[0].pontos
	
func botarTela(result):
	#print(result)
	label_id_planta.text = "" + str(result.nomePlanta) 
	label_temperatura.text = "" + str(result.temperatura) + "º" 
	label_umidade.text = "" + str(result.umidade) + "%"  
	label_umidade_solo.text = "" + str(result.umidadeSolo) + "%" 
	label_luminosidade.text = "" + str(result.luminosidade) + "%" 
	label_pontos.text = "R$" + str(result.pontos) + "" 
	label_fundo.text = "" + str(result.idFundoAtual) + "" 
	label_roupa.text = "" + str(result.idRoupaAtual) + "" 
	Global.gold = result.pontos
	mudarTextura(int(result.temperatura), int(result.umidade), int(result.umidadeSolo))
	





#Colocar função pra pegar os valores da API e colocar como valor global de gold e usar para as compras e tals
#Guardar no local storage os ultimos valores
#


func _on_http_request_vitor_request_completed(result, response_code, headers, body):
	print(result)
	print(response_code)
	print(headers)
	print(body)
	var json = JSON.new()
	json.parse(body.get_string_from_utf8())
	var response = json.get_data()
	print(response)
	botarTela(response)
	texture_button.disabled = false
	#botarTela(result)
	pass # Replace with function body.


@onready var carinha_imagem = $VBoxContainer/BoxContainer/BoxContainer/AspectRatioContainer3/CarinhaImagem

func mudarTextura(temp, umidA, umidS):
	if(temp >= 30):
		carinha_imagem.texture = load("res://expresoes/calor.png")
	elif(temp <= 15):
		carinha_imagem.texture = load("res://expresoes/frio.png")
	elif(umidA >= 80):
		carinha_imagem.texture = load("res://expresoes/resfriado.png")
	elif(umidA <= 20):
		carinha_imagem.texture =load("res://expresoes/ofegante.png")
	elif(umidS >= 80):
		carinha_imagem.texture = load("res://expresoes/enjoado.png")
	elif(umidS <= 30):
		carinha_imagem.texture = load("res://expresoes/sede.png")
	else:
		carinha_imagem.texture = load("res://expresoes/facial_03.png")
	

#const float TEMP_MAX = 30.0;       //se for maior que 30 - calor
#const float TEMP_MIN = 15.0;       //se for menor que 15 - frio
#const float UMID_AMBI_MAX = 80.0;  //se for maior que 80 - Resfriado
#const float UMID_AMBI_MIN = 20.0;  //se for menor que 20 - ofegante
#const int UMID_SOLO_MAX = 80;      //se for maior que 80 - enjoado
#const int UMID_SOLO_MIN = 30;      //se for menor que 30 - sede

	
