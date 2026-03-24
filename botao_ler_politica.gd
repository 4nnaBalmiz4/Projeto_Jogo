extends Button

func _ready():
	modulate.a = 0.0
	pressed.connect(_on_pressed)
	mouse_entered.connect(_on_mouse_entered)  # ← faltava isso
	mouse_exited.connect(_on_mouse_exited)    # ← e isso

func _on_mouse_entered():
	modulate.a = 1.0

func _on_mouse_exited():
	modulate.a = 0.0

func _on_pressed():
	get_tree().change_scene_to_file("res://cena4.tscn")
