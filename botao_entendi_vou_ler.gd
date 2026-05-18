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
	Global.vidas += 1
	Global.perdeu_vida = true  # ← marca que perdeu vida
	get_tree().change_scene_to_file("res://cena3.1.tscn")
