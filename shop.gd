extends CanvasLayer

var currItem = 0
var select = 0

@onready var audio_erro: AudioStreamPlayer = $AudioErro
@onready var audio_sucesso: AudioStreamPlayer = $AudioSucesso
@onready var audio_normal: AudioStreamPlayer = $AudioNormal


# Called when the node enters the scene tree for the first time.
func _ready():
	switchItem(select)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_fechar_pressed():
	cliqueBotao()
	get_node("AnimationPlayer").play("TransOut")
	pass # Replace with function body.

func switchItem(select):
	for i in range(Global.items.size()):
		if select == i:
			currItem = select
			get_node("Control/AnimSprite").play(Global.items[currItem]["Name"]) 
			get_node("Control/Name").text = Global.items[currItem]["Name"]
			get_node("Control/Des").text = Global.items[currItem]["Des"]
			get_node("Control/Des").text +=  "\nR$" + str(Global.items[currItem]["Cost"])
			

func _on_next_pressed():
	cliqueBotao()
	switchItem(currItem+1)
	pass # Replace with function body.


@onready var http_request = $HTTPRequest


func _on_prev_pressed():
	cliqueBotao()
	switchItem(currItem-1)
	pass # Replace with function body.


func enviarDados(idRoupa, idFundo):
	var data_to_send = {
	"Id":6,
	"IdRoupaAtual":str(idRoupa),
	"IdFundoAtual":str(idFundo)
	}
	var url = "https://peblit.azurewebsites.net/AlterarRoupa"
	var json = JSON.stringify(data_to_send)
	#print(json)
	var headers = ["Content-Type: application/json"]
	#print(headers)
	http_request.request(url, headers, HTTPClient.METHOD_PUT, json)
	
@onready var label_roupa = $"../VBoxContainer/MarginContainer2/TextureRect/HBoxContainer/roupa/LabelRoupa"
@onready var label_fundo = $"../VBoxContainer/MarginContainer2/TextureRect/HBoxContainer/fundo/LabelFundo"

func definirLabelRF(fundo, roupa):
	label_fundo.text = "" + str(fundo)
	label_roupa.text = "" + str(roupa)

func _on_buy_pressed():
	if Global.playerData.gold >= Global.items[currItem]["Cost"]:
		compraSucesso()
		#enviarDados(currItem, currItem)
		#var instance = MenuPrincipal.new()
		definirLabelRF(str(currItem), str(currItem))
		
		
		var hasItem = false
		for i in Global.inventory:
			if Global.inventory[i]["Name"] == Global.items[currItem]["Name"]:
				#Global.inventory[i]["Count"] += 1
				if Global.items[i]["Cat"] == 2:
					#manda pra fundo
					#Fundo selecionado = i
					pass
				else:
					#manda pra roupa
					#Roupa selecionada = i
					pass
				hasItem = true
		if hasItem == false:
			Global.inventory[Global.inventory.size()] = Global.items[currItem]
			Global.playerData.gold -= Global.items[currItem]["Cost"]
			Global.inventory[Global.inventory.size()-1]["Count"] = 1
		print(Global.inventory)
	else: 
		erroNaCompra()

# Criar lógica para ter mais de uma categoria na loja
# Criar lógica pra ver se o item ta no inventário, se estiver mudar o texto pra selecionar ao invés de comprar

		


func _on_http_request_request_completed(result, response_code, headers, body):
	var json = JSON.parse_string(body.get_string_from_utf8())
	print(json)
	
	
	
	
func erroNaCompra() -> void:
	audio_erro.play()
	
	
func compraSucesso() -> void:
	audio_sucesso.play()
	
	
func cliqueBotao() -> void:
	audio_normal.play()
	
	
