extends Button

func _ready():
	pressed.connect(_on_pressed)
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)

func _on_mouse_entered():
	modulate.a = 1.0

func _on_mouse_exited():
	modulate.a = 0.5  # fica semitransparente quando mouse sai

func _on_pressed():
	get_tree().change_scene_to_file("res://cena2.tscn")
