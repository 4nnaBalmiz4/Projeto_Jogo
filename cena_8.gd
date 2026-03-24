extends Node

@onready var player = $AudioStreamPlayer

func _ready():
	player.stream.loop = false
	player.play()
