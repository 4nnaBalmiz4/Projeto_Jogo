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
	get_tree().change_scene_to_file("res://cena3.tscn")


func _on_botao_ler_politica_pressed() -> void:
	pass # Replace with function body.


func _on_botao_ler_politica_mouse_entered() -> void:
	pass # Replace with function body.


func _on_botao_ler_politica_mouse_exited() -> void:
	pass # Replace with function body.
