extends Node

var vidas = 0
var perdeu_vida = false
var servidor1_visitado = false
var servidor2_visitado = false
var servidor3_visitado = false
var voltou_para_cena2 = false
var diario_ja_visto = false
var diario_ja_visto_f2 = false
var fase_atual = 1
var servidor1_correto = false
var servidor2_correto = false
var servidor3_correto = false


func game_over():
	# Efeito de fade-out (tela escurece antes do game over)
	var canvas = CanvasLayer.new()
	canvas.layer = 100
	var tree = get_tree()
	tree.root.add_child(canvas)
	var overlay = ColorRect.new()
	overlay.color = Color(0, 0, 0, 0.0)
	overlay.set_anchors_preset(Control.PRESET_FULL_RECT)
	canvas.add_child(overlay)
	var tween = tree.create_tween()
	tween.tween_property(overlay, "color:a", 1.0, 0.6).set_ease(Tween.EASE_IN)
	await tween.finished
	canvas.queue_free()
	tree.change_scene_to_file("res://gameOver.tscn")


# Chamado automaticamente sempre que vidas mudar
# Retorna true se houve game over
func perder_vida() -> bool:
	vidas += 1
	perdeu_vida = true
	if vidas >= 4:
		game_over()
		return true
	return false
