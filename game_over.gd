extends Node2D

@onready var botao = $Button

func _ready() -> void:
	botao.pressed.connect(_on_botao_voltar_pressed)
	
	# Toca o som de game over
	var som = AudioStreamPlayer.new()
	som.stream = preload("res://framesJogo/somGameOver.mp3")
	add_child(som)
	som.play()
	
	# Efeito de fade-in (tela começa preta e revela)
	var canvas = CanvasLayer.new()
	canvas.layer = 10
	add_child(canvas)
	var overlay = ColorRect.new()
	overlay.color = Color(0, 0, 0, 1.0)
	overlay.set_anchors_preset(Control.PRESET_FULL_RECT)
	canvas.add_child(overlay)
	var tween = create_tween()
	tween.tween_property(overlay, "color:a", 0.0, 1.0).set_ease(Tween.EASE_OUT)
	tween.tween_callback(canvas.queue_free)


func _on_botao_voltar_pressed() -> void:
	# Reseta as vidas
	Global.vidas = 0
	Global.perdeu_vida = false

	# Reseta o progresso da fase atual
	match Global.fase_atual:
		1:
			_resetar_fase1()
			get_tree().change_scene_to_file("res://cena2.tscn")
		2:
			_resetar_fase2()
			get_tree().change_scene_to_file("res://f2_cena2.tscn")


func _resetar_fase1():
	Global.voltou_para_cena2 = false
	Global.diario_ja_visto = false


func _resetar_fase2():
	Global.servidor1_visitado = false
	Global.servidor2_visitado = false
	Global.servidor3_visitado = false
	Global.servidor1_correto = false
	Global.servidor2_correto = false
	Global.servidor3_correto = false
	Global.diario_ja_visto_f2 = false
