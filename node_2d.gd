extends Node2D

@onready var anim_player = $AnimationPlayer

func _ready():
	anim_player.play("anim_aviso")


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://dialogo1.tscn")
