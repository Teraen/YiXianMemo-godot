extends Node

signal exit_contact_container

func _on_mouse_exited() -> void:
	emit_signal("exit_contact_container")
