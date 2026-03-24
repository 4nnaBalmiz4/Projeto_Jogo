extends Node2D

var imagens_vida = [
	preload("res://framesJogo/barraVidaCompleta 1.png"),
	preload("res://framesJogo/barraVida-1 1.png"),
	preload("res://framesJogo/barraVida-2 1.png"),
	preload("res://framesJogo/barraVida-3 1.png"),
	preload("res://framesJogo/barraVida-4 1.png")
]

@onready var barra = $barraVida

func _ready():
	barra.texture = imagens_vida[Global.vidas]
	if Global.perdeu_vida:
		_animar_perda_vida()
		Global.perdeu_vida = false  # reseta após animar
	if Global.vidas >= 5:
		get_tree().change_scene_to_file("res://gameOver.tscn")

func _animar_perda_vida():
	var tween = create_tween()
	tween.tween_property(barra, "modulate:a", 0.0, 0.1)
	tween.tween_property(barra, "modulate:a", 1.0, 0.1)
	tween.tween_property(barra, "modulate:a", 0.0, 0.1)
	tween.tween_property(barra, "modulate:a", 1.0, 0.1)
	tween.tween_property(barra, "modulate:a", 0.0, 0.1)
	tween.tween_property(barra, "modulate:a", 1.0, 0.1)
