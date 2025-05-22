extends Button

var Num: int = 8
var display_num: int = 2
var mode: bool = false
@onready var detail_mode: CheckButton = $"../../../../Buttons/DetailMode"
@onready var display: Label = $display

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if detail_mode.button_pressed:
		mode = true
		display_num = Num
	else:
		display_num = Num/3
		mode = false
	display.text = str(display_num)

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
	display.text = str(display_num)
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
			Num = Num + 1
		if mode == false:
			display_num = Num/3
		else:
			display_num = Num
		display.text = str(display_num)
		
		update_display()

func update_display() -> void:
	display.text = str(display_num)

	# 根据数值设置颜色
	if display_num == 2:
		display.add_theme_color_override("font_color", Color(1, 0.5, 0)) # 橙色
	elif display_num == 1:
		display.add_theme_color_override("font_color", Color(1, 0, 0)) # 红色
	else:
		display.add_theme_color_override("font_color", Color(1, 1, 1)) # 默认白色

	# 控制可见性
	visible = display_num >= 1
