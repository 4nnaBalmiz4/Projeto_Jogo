extends Node2D

@onready var comemoracao = $comemoração
@onready var botao = $Button

var confetes = []

func _ready():
	comemoracao.play()
	botao.pressed.connect(_on_button_pressed)
	_spawnar_confetes()


func _process(delta: float) -> void:
	for c in confetes:
		if is_instance_valid(c):
			c.position.y += c.get_meta("velocidade_y") * delta
			c.position.x += c.get_meta("velocidade_x") * delta
			c.rotation += c.get_meta("rotacao") * delta
			if c.position.y > get_viewport_rect().size.y + 20:
				c.queue_free()

	confetes = confetes.filter(func(c): return is_instance_valid(c))


func _spawnar_confetes() -> void:
	for i in range(120):
		var delay = randf_range(0.0, 3.0)
		get_tree().create_timer(delay).timeout.connect(_criar_confete)


func _criar_confete() -> void:
	var confete = ColorRect.new()

	confete.size = Vector2(randf_range(6, 14), randf_range(10, 20))

	var tons_verde = [
		Color(0.0, 0.8, 0.2),
		Color(0.0, 1.0, 0.3),
		Color(0.2, 0.9, 0.1),
		Color(0.0, 0.6, 0.15),
		Color(0.4, 1.0, 0.4),
		Color(0.1, 0.7, 0.3),
	]
	confete.color = tons_verde[randi() % tons_verde.size()]

	confete.position = Vector2(randf_range(0, get_viewport_rect().size.x), randf_range(-50, -5))
	confete.set_meta("velocidade_y", randf_range(200, 400))
	confete.set_meta("velocidade_x", randf_range(-60, 60))
	confete.set_meta("rotacao", randf_range(-5.0, 5.0))

	add_child(confete)
	confetes.append(confete)


func _on_button_pressed() -> void:
	Global.fase_atual = 2
	get_tree().change_scene_to_file("res://f2_cena7.tscn")
