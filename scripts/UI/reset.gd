extends Button

@onready var label: Label = $"../../Label"


func _ready():
	Global.sidejob1 = -1
	Global.sidejob2 = -1


func _on_pressed() -> void:
	label.kill_processes("Python.exe")
	get_tree().reload_current_scene()
