extends Button
var Num: int = 6
var display_num: int = 2
var mode: bool = false

@onready var cards_num: Label = $display
@onready var detail_mode: CheckButton = $"../../../../DetailMode"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if detail_mode.button_pressed:
		mode = true
		display_num = Num
	else:
		display_num = Num/3
		mode = false
	cards_num.text = str(display_num)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
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
		cards_num.text = str(display_num)
			
