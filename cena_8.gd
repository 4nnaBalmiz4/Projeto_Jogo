extends Node

@onready var player = $AudioStreamPlayer

func _ready():
	player.stream.loop = false
	player.play()


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://f2_cena1.tscn")
