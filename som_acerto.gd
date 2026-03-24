extends Node

# Referencia o nó de áudio que está logo abaixo dele
@onready var player = $AudioStreamPlayer

func tocar_acerto():
	# Verifica se o player existe e se tem um som carregado
	if player and player.stream:
		player.play()
	else:
		print("Erro: O AudioStreamPlayer está sem som no Inspetor!")
