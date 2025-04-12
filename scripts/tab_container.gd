extends TabContainer

func _ready() -> void:
	current_tab = Global.Tab

func _on_tab_changed(tab: int) -> void:
	Global.Tab = tab
