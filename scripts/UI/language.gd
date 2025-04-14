extends Button
@onready var reset: Button = $"../Reset"


func _ready() -> void:
	button_pressed = Global.language
	if button_pressed == true:
		TranslationServer.set_locale("en")

	else:
		TranslationServer.set_locale("zh_CN")

		
func _on_toggled(toggled_on: bool) -> void:
	Global.language = toggled_on
	if toggled_on == true:
		TranslationServer.set_locale("en")
	else:
		TranslationServer.set_locale("zh_CN")
	
