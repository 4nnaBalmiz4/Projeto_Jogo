extends Control

@onready var teste_intro = $TesteIntro
@onready var tela_intro = $TelaIntro
@onready var tela_celular = $TelaCelular
@onready var tela_politica = $TelaPolitica
@onready var tela_aviso = $TelaAviso
@onready var tela_dialogo1 = $TelaDialogo1
@onready var tela_dialogo2 = $TelaDialogo2

func _ready():
	mostrar_tela(teste_intro)

func mostrar_tela(tela):
	teste_intro.visible = false
	tela_intro.visible = false
	tela_celular.visible = false
	tela_politica.visible = false
	tela_aviso.visible = false
	tela_dialogo1.visible = false
	tela_dialogo2.visible = false
	
	tela.visible = true

func _on_button_pressed() -> void:
	mostrar_tela(tela_celular)


func _on_button_pressed1() -> void:
	mostrar_tela(tela_intro)
