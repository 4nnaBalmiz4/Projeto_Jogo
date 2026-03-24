extends Button

func _ready():
	# Começa invisível (alfa 0)
	modulate.a = 0.0
	
	# Conecta os sinais
	pressed.connect(_on_pressed)
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)

func _on_mouse_entered():
	modulate.a = 1.0

func _on_mouse_exited():
	modulate.a = 0.0

func _on_pressed():
	# 1. Chama a função que criamos no script do Autoload
	# O "SomErro" é o nome que você definiu nas configurações do projeto
	if SomErro:
		SomErro.tocar_erro()
	
	# 2. Aguarda 0.2 segundos (tempo para o som começar e ser ouvido)
	await get_tree().create_timer(0.2).timeout
	
	# 3. Muda a cena para a cena3
	get_tree().change_scene_to_file("res://cena3.tscn")
