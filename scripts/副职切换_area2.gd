extends ColorRect

@onready var 丹: TextureRect = $Button/CenterContainer/丹
@onready var 符: TextureRect = $Button/CenterContainer/符
@onready var 琴: TextureRect = $Button/CenterContainer/琴
@onready var 画: TextureRect = $Button/CenterContainer/画
@onready var 阵: TextureRect = $Button/CenterContainer/阵
@onready var 植: TextureRect = $Button/CenterContainer/植
@onready var 命: TextureRect = $Button/CenterContainer/命

@onready var elixir: Button = $"../../../TabContainer/副职/Elixir"
@onready var fulu: Button = $"../../../TabContainer/副职/Fulu"
@onready var music: Button = $"../../../TabContainer/副职/Music"
@onready var paint: Button = $"../../../TabContainer/副职/Paint"
@onready var formation: Button = $"../../../TabContainer/副职/Formation"
@onready var plant: Button = $"../../../TabContainer/副职/Plant"
@onready var fortune: Button = $"../../../TabContainer/副职/Fortune"

@onready var popup_panel: PopupPanel = $"../../../TabContainer/副职/PopupPanel"
@onready var 筑基: Button = $"../../../TabContainer/副职/PopupPanel/GridContainer/筑基"
@onready var 金丹: Button = $"../../../TabContainer/副职/PopupPanel/GridContainer/金丹"
@onready var 元婴: Button = $"../../../TabContainer/副职/PopupPanel/GridContainer/元婴"
@onready var 化神: Button = $"../../../TabContainer/副职/PopupPanel/GridContainer/化神"


signal Cards_Add_Area2(sidejob, JobAdd, level, LAR)
signal Interarea_Comun(SJ2, JA, LAR)

var LevelAddingRestrict = [0, 0, 0, 0, 0]
var SideJob = [0, 0, 0, 0, 0, 0, 0]
var lvl: int
var JobAdd: int
var sidejob2: int = -1

var tween_hover: Tween
var tween_click: Tween

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#设置中心原点
	pivot_offset = Vector2(39,57)
	筑基.pressed.connect(_on_筑基_pressed)
	金丹.pressed.connect(_on_金丹_pressed)
	元婴.pressed.connect(_on_元婴_pressed)
	化神.pressed.connect(_on_化神_pressed)
	elixir.pressed.connect(_on_elixir_pressed)
	fulu.pressed.connect(_on_fulu_pressed)
	music.pressed.connect(_on_music_pressed)
	paint.pressed.connect(_on_paint_pressed)
	formation.pressed.connect(_on_formation_pressed)
	plant.pressed.connect(_on_plant_pressed)
	fortune.pressed.connect(_on_fortune_pressed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#鼠标进入悬停动效
func _on_mouse_entered() -> void:
	z_index = 1
	if tween_hover and tween_hover.is_running():
		tween_hover.kill()
	tween_hover = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_ELASTIC)
	tween_hover.tween_property(self, "scale",Vector2(1.2,1.2),0.5)

#卡牌随光标旋转动效
func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		var mouse_pos: Vector2 = get_local_mouse_position()
		var lerp_val_x: float = remap(mouse_pos.x,0,size.x,0,1)
		var lerp_val_y: float = remap(mouse_pos.y,0,size.y,0,1)
		#method1：直接设定系数
		var x_rot = (lerp_val_y - 0.5) * 20
		var y_rot = - (lerp_val_x - 0.5) * 20
		#method2：通过弧度插值
		#var angle_x_max: float = deg_to_rad(15)
		#var angle_y_max: float = deg_to_rad(15)
		#var x_rot: float = rad_to_deg(lerp_angle(-angle_x_max, angle_x_max, lerp_val_x))
		#var y_rot: float = rad_to_deg(lerp_angle(angle_y_max, -angle_y_max, lerp_val_y))
		丹.set_instance_shader_parameter("x_rot", x_rot)
		丹.set_instance_shader_parameter("y_rot", y_rot)
		符.set_instance_shader_parameter("x_rot", x_rot)
		符.set_instance_shader_parameter("y_rot", y_rot)
		琴.set_instance_shader_parameter("x_rot", x_rot)
		琴.set_instance_shader_parameter("y_rot", y_rot)
		画.set_instance_shader_parameter("x_rot", x_rot)
		画.set_instance_shader_parameter("y_rot", y_rot)
		阵.set_instance_shader_parameter("x_rot", x_rot)
		阵.set_instance_shader_parameter("y_rot", y_rot)
		植.set_instance_shader_parameter("x_rot", x_rot)
		植.set_instance_shader_parameter("y_rot", y_rot)
		命.set_instance_shader_parameter("x_rot", x_rot)
		命.set_instance_shader_parameter("y_rot", y_rot)
		if lerp_val_x > 1 or lerp_val_y > 1:
			_on_mouse_exited()
#鼠标离开，重置动效
func _on_mouse_exited() -> void:
		丹.set_instance_shader_parameter("x_rot", 0)
		丹.set_instance_shader_parameter("y_rot", 0)
		符.set_instance_shader_parameter("x_rot", 0)
		符.set_instance_shader_parameter("y_rot", 0)
		琴.set_instance_shader_parameter("x_rot", 0)
		琴.set_instance_shader_parameter("y_rot", 0)
		画.set_instance_shader_parameter("x_rot", 0)
		画.set_instance_shader_parameter("y_rot", 0)
		阵.set_instance_shader_parameter("x_rot", 0)
		阵.set_instance_shader_parameter("y_rot", 0)
		植.set_instance_shader_parameter("x_rot", 0)
		植.set_instance_shader_parameter("y_rot", 0)
		命.set_instance_shader_parameter("x_rot", 0)
		命.set_instance_shader_parameter("y_rot", 0)
		if tween_hover and tween_hover.is_running():
			tween_hover.kill()
		tween_hover = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_ELASTIC)
		tween_hover.tween_property(self,"scale",Vector2(1,1),0.5)
		z_index = 0

#点击动效
func _on_button_button_down() -> void:
	if tween_click and tween_click.is_running():
		tween_click.kill()
	tween_click = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BACK)
	tween_click.tween_property(self,"scale",Vector2(1,1),0.1)
func _on_button_button_up() -> void:
	if tween_click and tween_click.is_running():
		tween_click.kill()
	tween_click = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_ELASTIC)
	tween_click.tween_property(self,"scale",Vector2(1.2,1.2),0.3)

#副职切换及兼职
func _on_elixir_pressed() -> void:
	JobAdd = 0
#	选择初始副职
	if Global.sidejob1 != -1 and Global.sidejob1 != JobAdd:
		if Global.sidejob2 == -1 or Global.sidejob2 ==JobAdd:
			print("1")
			sidejob2 = JobAdd
			popup_panel.popup()

func _on_fulu_pressed() -> void:
	JobAdd = 1
#	选择初始副职
	if Global.sidejob1 != -1 and Global.sidejob1 != JobAdd:
		if Global.sidejob2 == -1 or Global.sidejob2 ==JobAdd:
			sidejob2 = JobAdd
			popup_panel.popup()

func _on_music_pressed() -> void:
	JobAdd = 2
#	选择初始副职
	if Global.sidejob1 != -1 and Global.sidejob1 != JobAdd:
		if Global.sidejob2 == -1 or Global.sidejob2 ==JobAdd:
			sidejob2 = JobAdd
			popup_panel.popup()

func _on_paint_pressed() -> void:
	JobAdd = 3
#	选择初始副职
	if Global.sidejob1 != -1 and Global.sidejob1 != JobAdd:
		if Global.sidejob2 == -1 or Global.sidejob2 ==JobAdd:
			sidejob2 = JobAdd
			popup_panel.popup()

func _on_formation_pressed() -> void:
	JobAdd = 4
#	选择初始副职
	if Global.sidejob1 != -1 and Global.sidejob1 != JobAdd:
		if Global.sidejob2 == -1 or Global.sidejob2 ==JobAdd:
			sidejob2 = JobAdd
			popup_panel.popup()

func _on_plant_pressed() -> void:
	JobAdd = 5
#	选择初始副职
	if Global.sidejob1 != -1 and Global.sidejob1 != JobAdd:
		if Global.sidejob2 == -1 or Global.sidejob2 ==JobAdd:
			sidejob2 = JobAdd
			popup_panel.popup()

func _on_fortune_pressed() -> void:
	JobAdd = 6
#	选择初始副职
	if Global.sidejob1 != -1 and Global.sidejob1 != JobAdd:
		if Global.sidejob2 == -1 or Global.sidejob2 ==JobAdd:
			sidejob2 = JobAdd
			popup_panel.popup()

func _on_筑基_pressed():
	if LevelAddingRestrict[1] == 0 and JobAdd == sidejob2:
		print("2")
		lvl = 1
		Global.sidejob2 = JobAdd
		LevelAddingRestrict[1] = 1
		emit_signal("Cards_Add_Area2",Global.sidejob2, JobAdd, lvl, LevelAddingRestrict)
		emit_signal("Interarea_Comun", sidejob2, JobAdd, LevelAddingRestrict)
	popup_panel.hide()

func _on_金丹_pressed():
	if LevelAddingRestrict[2] == 0 and JobAdd == sidejob2:
		lvl = 2
		Global.sidejob2 = JobAdd
		LevelAddingRestrict[2] = 1
		emit_signal("Cards_Add_Area2",Global.sidejob2, JobAdd, lvl, LevelAddingRestrict)
		emit_signal("Interarea_Comun", sidejob2, JobAdd, LevelAddingRestrict)
	popup_panel.hide()

func _on_元婴_pressed():
	if LevelAddingRestrict[3] == 0 and JobAdd == sidejob2:
		lvl = 3
		Global.sidejob2 = JobAdd
		LevelAddingRestrict[3] = 1
		emit_signal("Cards_Add_Area2",Global.sidejob2, JobAdd, lvl, LevelAddingRestrict)
		emit_signal("Interarea_Comun", sidejob2, JobAdd, LevelAddingRestrict)
	popup_panel.hide()

func _on_化神_pressed():
	if LevelAddingRestrict[4] == 0 and JobAdd == sidejob2:
		lvl = 4
		Global.sidejob2 = JobAdd
		LevelAddingRestrict[4] = 1
		emit_signal("Cards_Add_Area2",Global.sidejob2, JobAdd, lvl, LevelAddingRestrict)
		emit_signal("Interarea_Comun", sidejob2, JobAdd, LevelAddingRestrict)
	popup_panel.hide()


func _on_side_job_11_interarea_comun(SJ1: Variant, JA: Variant, LAR: Variant) -> void:
	JobAdd = JA
	LevelAddingRestrict = LAR

func _on_side_job_12_interarea_comun(SJ1: Variant, JA: Variant, LAR: Variant) -> void:
	JobAdd = JA
	LevelAddingRestrict = LAR

func _on_side_job_13_interarea_comun(SJ1: Variant, JA: Variant, LAR: Variant) -> void:
	JobAdd = JA
	LevelAddingRestrict = LAR
