extends Control

signal startGame
signal exit

func _ready():
	pass 


func _on_TextureButton_pressed():
	emit_signal("startGame")
