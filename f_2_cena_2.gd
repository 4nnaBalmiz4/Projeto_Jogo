extends Node2D

var servidor1_visitado = false
var servidor2_visitado = false
var servidor3_visitado = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$BotaoAvancar.disabled = true
	verificar_progresso()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

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
	
