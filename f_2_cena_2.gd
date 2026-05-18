extends Node2D

var imagens_vida = [
	preload("res://framesJogo/barraVidaCompleta 1.png"),
	preload("res://framesJogo/barraVida-1 1.png"),
	preload("res://framesJogo/barraVida-2 1.png"),
	preload("res://framesJogo/barraVida-3 1.png"),
	preload("res://framesJogo/barraVida-4 1.png")
]

var servidor1_visitado = false
var servidor2_visitado = false
var servidor3_visitado = false

func _ready() -> void:
	$BotaoAvancar.disabled = true
	verificar_progresso()
	atualizar_barra_vida()

func _process(delta: float) -> void:
	if Global.perdeu_vida:
		Global.perdeu_vida = false
		atualizar_barra_vida()
		verificar_game_over()

func _on_button_pressed() -> void:
	Global.servidor1_visitado = true
	get_tree().change_scene_to_file("res://f2_cena3.tscn")

func _on_button_2_pressed() -> void:
	Global.servidor2_visitado = true
	get_tree().change_scene_to_file("res://f2_cena4.tscn")

func _on_button_3_pressed() -> void:
	Global.servidor3_visitado = true
	get_tree().change_scene_to_file("res://f2_cena5.tscn")

func verificar_progresso():
	if Global.servidor1_visitado and Global.servidor2_visitado and Global.servidor3_visitado:
		$BotaoAvancar.disabled = false

func _on_botao_avancar_pressed() -> void:
	get_tree().change_scene_to_file("res://f2_cena6.tscn")

func atualizar_barra_vida():
	var indice = clamp(Global.vidas, 0, imagens_vida.size() - 1)
	$barraVida.texture = imagens_vida[indice]

func verificar_game_over():
	if Global.vidas >= imagens_vida.size():
		Global.game_over()
