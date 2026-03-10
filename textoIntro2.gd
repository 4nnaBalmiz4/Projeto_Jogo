extends Label

@export var velocidade_texto: float = 0.05

signal terminou_texto

var digitando = true

func _ready():
	visible_characters = 0
	digitar()

func digitar():
	digitando = true

	for i in text.length():
		if not digitando:
			return

		visible_characters += 1
		await get_tree().create_timer(velocidade_texto).timeout

	digitando = false
	terminou_texto.emit()

func _input(event):
	if event.is_action_pressed("click"):
		if digitando:
			visible_characters = text.length()
			digitando = false
			terminou_texto.emit()
