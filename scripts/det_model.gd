extends Button

@onready var reset: Button = $"../Reset"

var DIR = "C:/YiXianMemo" #PyFiles文件夹所在位置
var current_model
var det_DIR
var det_server_DIR
var det_mobile_DIR
signal reset_program

func _ready() -> void:
	reset_program.connect(reset._on_pressed)
	if OS.has_feature("editor"):
		pass
	else:
		DIR = OS.get_executable_path().get_base_dir()
	det_DIR = DIR.path_join("PyFiles/Models/det/")
	det_server_DIR = DIR.path_join("PyFiles/Models/det-server/")
	det_mobile_DIR = DIR.path_join("PyFiles/Models/det-mobile/")
	refresh_texts()


func _on_pressed() -> void:
	if current_model == "det-mobile":
		DirAccess.rename_absolute(det_DIR, det_mobile_DIR)
		DirAccess.rename_absolute(det_server_DIR, det_DIR)
		current_model = "det_server"
		emit_signal("reset_program")
	else:
		DirAccess.rename_absolute(det_DIR, det_server_DIR)
		DirAccess.rename_absolute(det_mobile_DIR, det_DIR)
		current_model = "det-mobile"
		emit_signal("reset_program")

func refresh_texts() -> void:
	if DirAccess.dir_exists_absolute(det_server_DIR):
		current_model = "det-mobile"
		text = tr("low_det_model")
		tooltip_text = tr("tool_tip_mobile_model")
	else:
		current_model = "det-server"
		text = tr("high_det_model")
		tooltip_text = tr("tool_tip_server_model")
