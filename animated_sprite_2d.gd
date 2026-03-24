extends AnimatedSprite2D

@onready var botao = $"../botaoInvestigar"  # ajuste o caminho se necessário

func _ready():
	play("default")
	# Esconde o botão no início
	botao.visible = false
	# Conecta o sinal de fim de animação
	animation_finished.connect(_ao_terminar_animacao)

func _ao_terminar_animacao():
	botao.visible = true  # mostra o botão quando a animação acabar
