extends Node2D

@onready var video_player = $VideoStreamPlayer
@onready var mapa = $MapaFases
@onready var botao_fase1 = $MapaFases/BotaoFase1
@onready var botao_fase2 = $MapaFases/BotaoFase2

var brilho_tween: Tween

func _ready():
	# Conecta os botões
	botao_fase1.pressed.connect(_on_botao_fase1_pressed)
	botao_fase2.pressed.connect(_on_botao_fase2_pressed)

	if Global.fase_atual >= 2:
		# Vindo da fase 1 concluída: mostra o mapa direto com fase 2 piscando
		video_player.visible = false
		video_player.stop()
		mapa.visible = true
		_iniciar_brilho(botao_fase2)
	else:
		# Primeira vez: mostra o vídeo e depois o mapa com fase 1 piscando
		mapa.visible = false
		video_player.finished.connect(_on_video_finished)

func _on_video_finished():
	# Esconde o vídeo e mostra o mapa
	video_player.visible = false
	mapa.visible = true
	# Inicia o efeito de brilho no botão da fase 1
	_iniciar_brilho(botao_fase1)

func _iniciar_brilho(botao: Button):
	if brilho_tween:
		brilho_tween.kill()
	brilho_tween = create_tween().set_loops()
	brilho_tween.tween_property(botao, "modulate", Color(3.0, 2.0, 0.0, 1.0), 0.4).set_trans(Tween.TRANS_SINE)
	brilho_tween.tween_property(botao, "modulate", Color(1.0, 0.5, 0.0, 1.0), 0.4).set_trans(Tween.TRANS_SINE)

func _on_botao_fase1_pressed():
	if brilho_tween:
		brilho_tween.kill()
	get_tree().change_scene_to_file("res://cena1.tscn")

func _on_botao_fase2_pressed():
	if brilho_tween:
		brilho_tween.kill()
	Global.vidas = 0
	Global.perdeu_vida = false
	get_tree().change_scene_to_file("res://f2_cena1.tscn")
