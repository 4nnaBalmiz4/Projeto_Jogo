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
	get_tree().change_scene_to_file("res://cena5.tscn")
