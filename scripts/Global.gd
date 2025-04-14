extends Node


var sidejob1 = -1
var sidejob2 = -1
var JobAdd = -1

var toggle = [true, false, false, false]
var Tab = 0
var DetailMode = true
var Popup_window = false
@export var language = false

var err_log: String
@onready var DIR = OS.get_executable_path().get_base_dir()
@onready var  LOG_PATH = DIR.path_join("PyFiles/error_log.txt")


func _ready():
		# 初始化日志文件（清空旧内容）
	var init_file = FileAccess.open(LOG_PATH, FileAccess.WRITE)
	if init_file:
		init_file.store_string("----- 日志开始 -----\n")
		init_file.close()
	err_log = err_log + str(DisplayServer.screen_get_size()) + "\n" + OS.get_processor_name() + "\n" + RenderingServer.get_video_adapter_name() + "\n"
