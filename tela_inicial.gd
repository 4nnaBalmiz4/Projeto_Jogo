extends Node2D

# Referências aos botões
@onready var botao_jogar = $botãoJogar
@onready var botao_sair = $botãoSair

# Nome da próxima cena (ajuste o caminho conforme seu projeto)
const PROXIMA_CENA = "res://telaFases.tscn"


func _ready():
	# Deixa os botões invisíveis no início
	botao_jogar.modulate.a = 0.0
	botao_sair.modulate.a = 0.0

	# Conecta os sinais de hover e clique do botão Jogar
	botao_jogar.mouse_entered.connect(_on_botao_jogar_mouse_entered)
	botao_jogar.mouse_exited.connect(_on_botao_jogar_mouse_exited)
	botao_jogar.pressed.connect(_on_botao_jogar_pressed)

	# Conecta os sinais de hover e clique do botão Sair
	botao_sair.mouse_entered.connect(_on_botao_sair_mouse_entered)
	botao_sair.mouse_exited.connect(_on_botao_sair_mouse_exited)
	botao_sair.pressed.connect(_on_botao_sair_pressed)


# ──────────────────────────────────────────────
#  BOTÃO JOGAR
# ──────────────────────────────────────────────

func _on_botao_jogar_mouse_entered():
	# Aparece suavemente ao passar o cursor
	var tween = create_tween()
	tween.tween_property(botao_jogar, "modulate:a", 1.0, 0.25)

func _on_botao_jogar_mouse_exited():
	# Some suavemente ao retirar o cursor
	var tween = create_tween()
	tween.tween_property(botao_jogar, "modulate:a", 0.0, 0.25)

func _on_botao_jogar_pressed():
	# Vai para a próxima cena
	get_tree().change_scene_to_file(PROXIMA_CENA)


# ──────────────────────────────────────────────
#  BOTÃO SAIR
# ──────────────────────────────────────────────

func _on_botao_sair_mouse_entered():
	var tween = create_tween()
	tween.tween_property(botao_sair, "modulate:a", 1.0, 0.25)

func _on_botao_sair_mouse_exited():
	var tween = create_tween()
	tween.tween_property(botao_sair, "modulate:a", 0.0, 0.25)

func _on_botao_sair_pressed():
	# Fecha o jogo
	get_tree().quit()
