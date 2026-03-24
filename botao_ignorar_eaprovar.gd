extends Button

func _ready():
	modulate.a = 0.0
	# Conecta os sinais locais do botão
	pressed.connect(_on_pressed)
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)

func _on_mouse_entered():
	modulate.a = 1.0

func _on_mouse_exited():
	modulate.a = 0.0

func _on_pressed():
	# 1. Toca o som de erro através do seu Autoload
	if SomErro:
		SomErro.tocar_erro()
	
	# 2. Atualiza a lógica global do seu jogo
	Global.vidas += 1
	Global.perdeu_vida = true
	
	# 3. Pequena pausa (0.2s) para o áudio não ser cortado bruscamente
	await get_tree().create_timer(0.2).timeout
	
	# 4. Muda a cena
	get_tree().change_scene_to_file("res://cena6.tscn")
