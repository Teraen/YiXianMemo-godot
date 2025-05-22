extends Button

@onready var 丹: TextureRect = $CenterContainer/丹
@onready var 符: TextureRect = $CenterContainer/符
@onready var 琴: TextureRect = $CenterContainer/琴
@onready var 画: TextureRect = $CenterContainer/画
@onready var 阵: TextureRect = $CenterContainer/阵
@onready var 植: TextureRect = $CenterContainer/植
@onready var 命: TextureRect = $CenterContainer/命

var ex_differ: int = -1
var Num: int = 0
var display_num: int = 0
var mode: bool = false
var job_current_area: int

@onready var cards_num: Label = $display
@onready var detail_mode: CheckButton = $"../../../../Buttons/DetailMode"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false
	if detail_mode.button_pressed:
		mode = true
		display_num = Num
	else:
		display_num = Num/3
		mode = false
	cards_num.text = str(display_num)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
#	检测并切换计数模式以及可见性
	if detail_mode.button_pressed:
		mode = true
		Global.DetailMode = true
		display_num = Num
	else:
		display_num = Num/3
		mode = false
		Global.DetailMode = false
	cards_num.text = str(display_num)
	if display_num<1:
		visible = false
	else:
		visible = true

	update_display()

func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		if event.button_index==2:
			Num = Num - 1
		elif event.button_index==1:
			Num = Num - ex_differ
		if mode == false:
			display_num = Num/3
		else:
			display_num = Num
		cards_num.text = str(display_num)
			
		update_display()

func update_display() -> void:
	cards_num.text = str(display_num)

	# 根据数值设置颜色
	if display_num == 2:
		cards_num.add_theme_color_override("font_color", Color(1, 0.5, 0)) # 橙色
	elif display_num == 1:
		cards_num.add_theme_color_override("font_color", Color(1, 0, 0)) # 红色
	else:
		cards_num.add_theme_color_override("font_color", Color(1, 1, 1)) # 默认白色

	# 控制可见性
	visible = display_num >= 1


func _on_side_job_11_cards_add(sidejob1: Variant, jobadd: Variant, lvl: Variant, LAR: Variant) -> void:
	if lvl == 0:#更改此判断语句，以适应不同境界副职卡牌的兼修逻辑
		if sidejob1 == 0:
			for node in get_tree().get_nodes_in_group("丹1"):
				node.visible=true
		elif sidejob1 == 1:
			for node in get_tree().get_nodes_in_group("符1"):
				node.visible=true
		elif sidejob1 == 2:
			for node in get_tree().get_nodes_in_group("琴1"):
				node.visible=true
		elif sidejob1 == 3:
			for node in get_tree().get_nodes_in_group("画1"):
				node.visible=true
		elif sidejob1 == 4:
			for node in get_tree().get_nodes_in_group("阵1"):
				node.visible=true
		elif sidejob1 == 5:
			for node in get_tree().get_nodes_in_group("植1"):
				node.visible=true
		elif sidejob1 == 6:
			for node in get_tree().get_nodes_in_group("命1"):
				node.visible=true
		job_current_area = sidejob1
		Num = Num + 8#更改此数字以修改此卡牌固有数量

func _on_画_visibility_changed() -> void:
	if job_current_area == 3:
		ex_differ = 1
