extends Button

func _ready():
	modulate.a = 0.0
	pressed.connect(_on_pressed)
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)

func _on_mouse_entered():
	modulate.a = 1.0

func _on_mouse_exited():
	modulate.a = 0.0

func _on_pressed():
	# 1. Toca o som usando o seu Autoload 'som_acerto'
	if SomAcerto:
		SomAcerto.tocar_acerto()
	
	# 2. Pequena pausa para ouvir o som do acerto
	await get_tree().create_timer(0.2).timeout
	
	# 3. Muda para a cena de sucesso
	get_tree().change_scene_to_file("res://cena4.tscn")
