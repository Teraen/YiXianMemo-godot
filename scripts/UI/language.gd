extends Button
@onready var det_model: Button = $"../det_model"

signal language_change

func _ready() -> void:
	language_change.connect(det_model.refresh_texts)
	button_pressed = Global.language
	if button_pressed == true:
		TranslationServer.set_locale("en")

	else:
		TranslationServer.set_locale("zh_CN")

		
func _on_toggled(toggled_on: bool) -> void:
	Global.language = toggled_on
	if toggled_on == true:
		TranslationServer.set_locale("en")
		emit_signal("language_change")
	else:
		TranslationServer.set_locale("zh_CN")
		emit_signal("language_change")
