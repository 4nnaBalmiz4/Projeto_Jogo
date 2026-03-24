extends AnimatedSprite2D

@onready var botao = $"../botaoContinuar"

func _ready():
	botao.visible = false
	play("default")
	frame_changed.connect(_on_frame_changed)
	botao.pressed.connect(_on_botao_pressed)

func _on_frame_changed():
	if frame == 5 or frame == 6 or frame == 7:
		pause()
		botao.visible = true
	else:
		botao.visible = false

func _on_botao_pressed():
	botao.visible = false
	play("default")
