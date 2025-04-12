extends Button

@onready var label: Label = $"../Label"


func _ready():
	Global.sidejob1 = -1
	Global.sidejob2 = -1
	label.kill_processes("Python.exe")


func _on_pressed() -> void:
	get_tree().reload_current_scene()
