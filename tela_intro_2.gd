extends Control

@onready var label = $Label
@onready var botao = $Button

func _ready():
	botao.visible = false

	label.terminou_texto.connect(mostrar_botao)

func mostrar_botao():
	botao.visible = true

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://telaCelular.tscn")
