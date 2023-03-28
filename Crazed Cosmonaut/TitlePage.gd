extends Control

signal startGame
signal exit

func _ready():
	pass 

func _on_Start_pressed():
	emit_signal("startGame")

func _on_Exit_pressed():
	emit_signal("exit")
