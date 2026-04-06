extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	if SomAcerto:
		SomAcerto.tocar_acerto()
	
	# 2. Pequena pausa para ouvir o som do acerto
	await get_tree().create_timer(0.2).timeout
	
	# 3. Muda para a cena de sucesso
	get_tree().change_scene_to_file("res://f2_cena2.tscn")


func _on_button_2_pressed() -> void:
	if SomErro:
		SomErro.tocar_erro()
	
	# 2. Atualiza a lógica global do seu jogo
	Global.vidas += 1
	Global.perdeu_vida = true
	
	# 3. Pequena pausa (0.2s) para o áudio não ser cortado bruscamente
	await get_tree().create_timer(0.2).timeout
