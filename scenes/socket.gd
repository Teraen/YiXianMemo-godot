extends Node

var DIR = "C:/Users/TeraEnemy/Desktop/Memo/通用/弈仙Memo2.0.1" #PyFiles文件夹所在位置

@onready var p101: Button = $"../GridContainer/VBoxContainer/Card1/Button"
@onready var p102: Button = $"../GridContainer/VBoxContainer/Card2/Button"
@onready var p103: Button = $"../GridContainer/VBoxContainer/Card3/Button"
@onready var p104: Button = $"../GridContainer/VBoxContainer/Card4/Button"
@onready var p105: Button = $"../GridContainer/VBoxContainer/Card5/Button"
@onready var p106: Button = $"../GridContainer/VBoxContainer/Card6/Button"
@onready var p107: Button = $"../GridContainer/VBoxContainer2/Card1/Button"
@onready var p108: Button = $"../GridContainer/VBoxContainer2/Card2/Button"
@onready var p109: Button = $"../GridContainer/VBoxContainer2/Card3/Button"
@onready var p110: Button = $"../GridContainer/VBoxContainer2/Card4/Button"
@onready var p111: Button = $"../GridContainer/VBoxContainer2/Card5/Button"
@onready var p112: Button = $"../GridContainer/VBoxContainer2/Card6/Button"
@onready var p201: Button = $"../GridContainer/VBoxContainer3/Card1/Button"
@onready var p202: Button = $"../GridContainer/VBoxContainer3/Card2/Button"
@onready var p203: Button = $"../GridContainer/VBoxContainer3/Card3/Button"
@onready var p204: Button = $"../GridContainer/VBoxContainer3/Card4/Button"
@onready var p205: Button = $"../GridContainer/VBoxContainer3/Card5/Button"
@onready var p206: Button = $"../GridContainer/VBoxContainer3/Card6/Button"
@onready var p207: Button = $"../GridContainer/VBoxContainer4/Card1/Button"
@onready var p208: Button = $"../GridContainer/VBoxContainer4/Card2/Button"
@onready var p209: Button = $"../GridContainer/VBoxContainer4/Card3/Button"
@onready var p210: Button = $"../GridContainer/VBoxContainer4/Card4/Button"
@onready var p211: Button = $"../GridContainer/VBoxContainer4/Card5/Button"
@onready var p212: Button = $"../GridContainer/VBoxContainer4/Card6/Button"
@onready var p301: Button = $"../GridContainer/VBoxContainer5/Card1/Button"
@onready var p302: Button = $"../GridContainer/VBoxContainer5/Card2/Button"
@onready var p303: Button = $"../GridContainer/VBoxContainer5/Card3/Button"
@onready var p304: Button = $"../GridContainer/VBoxContainer5/Card4/Button"
@onready var p305: Button = $"../GridContainer/VBoxContainer5/Card5/Button"
@onready var p306: Button = $"../GridContainer/VBoxContainer5/Card6/Button"
@onready var p307: Button = $"../GridContainer/VBoxContainer6/Card1/Button"
@onready var p308: Button = $"../GridContainer/VBoxContainer6/Card2/Button"
@onready var p309: Button = $"../GridContainer/VBoxContainer6/Card3/Button"
@onready var p310: Button = $"../GridContainer/VBoxContainer6/Card4/Button"
@onready var p311: Button = $"../GridContainer/VBoxContainer6/Card5/Button"
@onready var p312: Button = $"../GridContainer/VBoxContainer6/Card6/Button"
@onready var p401: Button = $"../GridContainer/VBoxContainer7/Card1/Button"
@onready var p402: Button = $"../GridContainer/VBoxContainer7/Card2/Button"
@onready var p403: Button = $"../GridContainer/VBoxContainer7/Card3/Button"
@onready var p404: Button = $"../GridContainer/VBoxContainer7/Card4/Button"
@onready var p405: Button = $"../GridContainer/VBoxContainer7/Card5/Button"
@onready var p406: Button = $"../GridContainer/VBoxContainer7/Card6/Button"
@onready var p407: Button = $"../GridContainer/VBoxContainer8/Card1/Button"
@onready var p408: Button = $"../GridContainer/VBoxContainer8/Card2/Button"
@onready var p409: Button = $"../GridContainer/VBoxContainer8/Card3/Button"
@onready var p410: Button = $"../GridContainer/VBoxContainer8/Card4/Button"
@onready var p411: Button = $"../GridContainer/VBoxContainer8/Card5/Button"
@onready var p412: Button = $"../GridContainer/VBoxContainer8/Card6/Button"
@onready var p501: Button = $"../GridContainer/VBoxContainer9/Card1/Button"
@onready var p502: Button = $"../GridContainer/VBoxContainer9/Card2/Button"
@onready var p503: Button = $"../GridContainer/VBoxContainer9/Card3/Button"
@onready var p504: Button = $"../GridContainer/VBoxContainer9/Card4/Button"
@onready var p505: Button = $"../GridContainer/VBoxContainer9/Card5/Button"
@onready var p506: Button = $"../GridContainer/VBoxContainer9/Card6/Button"
@onready var p507: Button = $"../GridContainer/VBoxContainer10/Card1/Button"
@onready var p508: Button = $"../GridContainer/VBoxContainer10/Card2/Button"

@onready var sp11_1: Button = $"../GridContainer/VBoxContainer11/SideJob_1-1/Button"
@onready var sp12_1: Button = $"../GridContainer/VBoxContainer11/SideJob_1-2/Button"
@onready var sp13_1: Button = $"../GridContainer/VBoxContainer11/SideJob_1-3/Button"
@onready var sp11_2: Button = $"../GridContainer/VBoxContainer11/SideJob_2-1/Button"
@onready var sp12_2: Button = $"../GridContainer/VBoxContainer11/SideJob_2-2/Button"
@onready var sp13_2: Button = $"../GridContainer/VBoxContainer11/SideJob_2-3/Button"

@onready var sp21_1: Button = $"../GridContainer/VBoxContainer12/SideJob_1-1/Button"
@onready var sp22_1: Button = $"../GridContainer/VBoxContainer12/SideJob_1-2/Button"
@onready var sp23_1: Button = $"../GridContainer/VBoxContainer12/SideJob_1-3/Button"
@onready var sp21_2: Button = $"../GridContainer/VBoxContainer12/SideJob_2-1/Button"
@onready var sp22_2: Button = $"../GridContainer/VBoxContainer12/SideJob_2-2/Button"
@onready var sp23_2: Button = $"../GridContainer/VBoxContainer12/SideJob_2-3/Button"

@onready var sp31_1: Button = $"../GridContainer/VBoxContainer13/SideJob_1-1/Button"
@onready var sp32_1: Button = $"../GridContainer/VBoxContainer13/SideJob_1-2/Button"
@onready var sp33_1: Button = $"../GridContainer/VBoxContainer13/SideJob_1-3/Button"
@onready var sp31_2: Button = $"../GridContainer/VBoxContainer13/SideJob_2-1/Button"
@onready var sp32_2: Button = $"../GridContainer/VBoxContainer13/SideJob_2-2/Button"
@onready var sp33_2: Button = $"../GridContainer/VBoxContainer13/SideJob_2-3/Button"

@onready var sp41_1: Button = $"../GridContainer/VBoxContainer14/SideJob_1-1/Button"
@onready var sp42_1: Button = $"../GridContainer/VBoxContainer14/SideJob_1-2/Button"
@onready var sp43_1: Button = $"../GridContainer/VBoxContainer14/SideJob_1-3/Button"
@onready var sp41_2: Button = $"../GridContainer/VBoxContainer14/SideJob_2-1/Button"
@onready var sp42_2: Button = $"../GridContainer/VBoxContainer14/SideJob_2-2/Button"
@onready var sp43_2: Button = $"../GridContainer/VBoxContainer14/SideJob_2-3/Button"

@onready var sp51_1: Button = $"../GridContainer/VBoxContainer15/SideJob_1-1/Button"
@onready var sp52_1: Button = $"../GridContainer/VBoxContainer15/SideJob_1-2/Button"
@onready var sp53_1: Button = $"../GridContainer/VBoxContainer15/SideJob_1-3/Button"
@onready var sp51_2: Button = $"../GridContainer/VBoxContainer15/SideJob_2-1/Button"
@onready var sp52_2: Button = $"../GridContainer/VBoxContainer15/SideJob_2-2/Button"
@onready var sp53_2: Button = $"../GridContainer/VBoxContainer15/SideJob_2-3/Button"


@onready var p_map = {
	"(Sect,p101)": p101, "(Sect,p102)": p102, "(Sect,p103)": p103, "(Sect,p104)": p104, "(Sect,p105)": p105, "(Sect,p106)": p106,
	"(Sect,p107)": p107, "(Sect,p108)": p108, "(Sect,p109)": p109, "(Sect,p110)": p110, "(Sect,p111)": p111, "(Sect,p112)": p112,
	"(Sect,p201)": p201, "(Sect,p202)": p202, "(Sect,p203)": p203, "(Sect,p204)": p204, "(Sect,p205)": p205, "(Sect,p206)": p206,
	"(Sect,p207)": p207, "(Sect,p208)": p208, "(Sect,p209)": p209, "(Sect,p210)": p210, "(Sect,p211)": p211, "(Sect,p212)": p212,
	"(Sect,p301)": p301, "(Sect,p302)": p302, "(Sect,p303)": p303, "(Sect,p304)": p304, "(Sect,p305)": p305, "(Sect,p306)": p306,
	"(Sect,p307)": p307, "(Sect,p308)": p308, "(Sect,p309)": p309, "(Sect,p310)": p310, "(Sect,p311)": p311, "(Sect,p312)": p312,
	"(Sect,p401)": p401, "(Sect,p402)": p402, "(Sect,p403)": p403, "(Sect,p404)": p404, "(Sect,p405)": p405, "(Sect,p406)": p406,
	"(Sect,p407)": p407, "(Sect,p408)": p408, "(Sect,p409)": p409, "(Sect,p410)": p410, "(Sect,p411)": p411, "(Sect,p412)": p412,
	"(Sect,p501)": p501, "(Sect,p502)": p502, "(Sect,p503)": p503, "(Sect,p504)": p504, "(Sect,p505)": p505, "(Sect,p506)": p506,
	"(Sect,p507)": p507, "(Sect,p508)": p508,
}

@onready var sp_map_1 = {
	"sp11": sp11_1,
	"sp12": sp12_1,
	"sp13": sp13_1,
	"sp21": sp21_1,
	"sp22": sp22_1,
	"sp23": sp23_1,
	"sp31": sp31_1,
	"sp32": sp32_1,
	"sp33": sp33_1,
	"sp41": sp41_1,
	"sp42": sp42_1,
	"sp43": sp43_1,
	"sp51": sp51_1,
	"sp52": sp52_1,
	"sp53": sp53_1
}
@onready var sp_map_2 = {
	"sp11": sp11_2,
	"sp12": sp12_2,
	"sp13": sp13_2,
	"sp21": sp21_2,
	"sp22": sp22_2,
	"sp23": sp23_2,
	"sp31": sp31_2,
	"sp32": sp32_2,
	"sp33": sp33_2,
	"sp41": sp41_2,
	"sp42": sp42_2,
	"sp43": sp43_2,
	"sp51": sp51_2,
	"sp52": sp52_2,
	"sp53": sp53_2
}


@onready var label: Label = $"."

var sidelist = ["Elixir","Fulu","Music","Paint","Formation","Plant","Fortune"]
const UDP_IP = "127.0.0.1"
const UDP_PORT = 4243
var server := UDPServer.new()
var runningtype :="0"
var process_pids :=[]
var dict: Dictionary


var python_path
var script_path
var LOG_PATH



func _notification(what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		Global.err_log = Global.err_log + _format_log("shut_down")
		handle_log(Global.err_log)
		kill_processes("Python.exe")
		get_tree().quit() # default behavior

func _ready():
	if OS.has_feature("editor"):
		pass
	else:
		DIR = OS.get_executable_path().get_base_dir()
	python_path = DIR.path_join("PyFiles/python.exe")
	script_path = DIR.path_join("PyFiles/server.py")
	LOG_PATH = DIR.path_join("PyFiles/error_log.txt")
	set_process(false)
	start_listening()
	start_server()

func _process(_delta):
# warning-ignore:return_value_discarded
	var size = 0
	server.poll()
	if server.is_connection_available():
		Global.err_log = Global.err_log + _format_log("take_connection")
		var peer : PacketPeerUDP = server.take_connection()
		var packet = peer.get_packet().get_string_from_utf8()
		#var json = JSON.new()
		#var parse_result = json.parse_string(packet)
		dict=parse_python_dict(packet)
		var keys = dict.keys()
		size = dict.keys().size()
		var i = 0
		while i < size:
			var split = keys[i].replace("\"", "").replace("(", "").replace(")", "").split(",")
			if keys[i] in p_map:
				var button = p_map[keys[i]]
				button.Num = button.Num + int(dict[keys[i]])
			elif split[0] == sidelist[Global.sidejob1] :
				var button = sp_map_1[split[1]]
				button.Num = button.Num + int(dict[keys[i]])
			elif split[0] == sidelist[Global.sidejob2] :
				var button = sp_map_2[split[1]]
				button.Num = button.Num + int(dict[keys[i]])
			else:
				label.text = "Info: " + keys[i]
				Global.err_log = Global.err_log + _format_log(keys[i])
			i += 1
		
func start_listening():
# warning-ignore:return_value_discarded
	server.listen(UDP_PORT)
	set_process(true)
	
func stop_listening():
	server.stop()
	set_process(false)
	
func start_server():
	var PID = OS.create_process(python_path, [script_path])
	Global.err_log = Global.err_log + _format_log("init_py: "+ str(PID))

	
func kill_processes(process_name):
	var output = []
	var result = OS.execute("taskkill", ["/F", "/IM", process_name], output, false)

func parse_python_dict(str_data: String):
	# 清洗字符串（移除首尾空格、花括号等）
	var cleaned = str_data.replace("'", "\"").replace(" ", "").lstrip("{").rstrip("}").strip_edges().replace(",(", ",((")
	
	# 分割键值对
	var dict = {}
	var pairs = cleaned.split(",(", false)
	
	for pair in pairs:
		var kv = pair.split(":", false, 1)
		if kv.size() != 2:
			continue
		
		var key = kv[0].strip_edges().replace("\"", "")
		var value = int(kv[1].strip_edges())
		
		dict[key] = value
		## 转换数据类型
		#if value.begins_with("[") and value.ends_with("]"):  # 数组
			#var items = value.lstrip("[").rstrip("]").split(",", false)
			#dict[key] = items.map(func(x): return x.strip_edges().to_float() if x.is_valid_float() else x)
		#elif value == "True":
			#dict[key] = true
		#elif value == "False":
			#dict[key] = false
		#elif value == "None":
			#dict[key] = null
		#elif value.is_valid_float():
			#dict[key] = value.to_float()
		#else:
			#dict[key] = value.trim_prefix("\"").trim_suffix("\"")
	
	return dict

func handle_log(message: String) -> void:
	# 打开文件并追加写入
	var file = FileAccess.open(LOG_PATH, FileAccess.READ_WRITE)
	if file:
		file.seek_end()  # 移动指针到文件末尾
		file.store_string(message)
		file.close()
		
func _format_log(msg: String) -> String:
	var level = "信息"
	if "ERROR" in msg: level = "错误"
	elif "WARNING" in msg: level = "警告"
	
	var time = Time.get_datetime_dict_from_system()
	return "[{year}-{month}-{day} {hour}:{minute}:{second}] [{level}] {msg}\n".format({
		"year": time.year, 
		"month": "%02d" % [time.month],  # ✅ 正确写法：参数放在数组中
		"day": "%02d" % [time.day],
		"hour": "%02d" % [time.hour],
		"minute": "%02d" % [time.minute],
		"second": "%02d" % [time.second],
		"level": level, 
		"msg": msg
	})
