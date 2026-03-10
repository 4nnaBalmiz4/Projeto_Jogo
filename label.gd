extends Label

@export var velocidade_texto: float = 0.1

func _ready():
	visible_characters = 0
	mostrar_texto()

func mostrar_texto():
	for i in text.length():
		visible_characters += 1
		await get_tree().create_timer(velocidade_texto).timeout
