extends ColorRect

@onready var cs: TextureRect = $Button/CenterContainer/CS
@onready var hs: TextureRect = $Button/CenterContainer/HS
@onready var fe: TextureRect = $Button/CenterContainer/FE
@onready var dx: TextureRect = $Button/CenterContainer/DX

@onready var cs_button: Button = $"../../../TabContainer/门派/CS"
@onready var hs_button: Button = $"../../../TabContainer/门派/HS"
@onready var fe_button: Button = $"../../../TabContainer/门派/FE"
@onready var dx_button: Button = $"../../../TabContainer/门派/DX"


var cs_toggled: bool
var hs_toggled: bool
var fe_toggled: bool
var dx_toggled: bool

var tween_hover: Tween
var tween_click: Tween

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#设置中心原点
	pivot_offset = Vector2(39,57)
	cs_button.button_pressed = Global.toggle[0]
	hs_button.button_pressed = Global.toggle[1]
	fe_button.button_pressed = Global.toggle[2]
	dx_button.button_pressed = Global.toggle[3]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

#门派切换
func _on_cs_toggled(cs_toggled: bool) -> void:
	if cs_toggled==true:
		Global.toggle = [true, false, false, false]
		for node in get_tree().get_nodes_in_group("CS_Group"):
			node.visible=cs_toggled
		for node in get_tree().get_nodes_in_group("HS_Group"):
			node.visible=hs_toggled
		for node in get_tree().get_nodes_in_group("FE_Group"):
			node.visible=fe_toggled
		for node in get_tree().get_nodes_in_group("DX_Group"):
			node.visible=dx_toggled
func _on_hs_toggled(hs_toggled: bool) -> void:
	if hs_toggled==true:
		Global.toggle = [false, true, false, false]
		for node in get_tree().get_nodes_in_group("CS_Group"):
			node.visible=cs_toggled
		for node in get_tree().get_nodes_in_group("HS_Group"):
			node.visible=hs_toggled
		for node in get_tree().get_nodes_in_group("FE_Group"):
			node.visible=fe_toggled
		for node in get_tree().get_nodes_in_group("DX_Group"):
			node.visible=dx_toggled
func _on_fe_toggled(fe_toggled: bool) -> void:
	Global.toggle = [false, false, true, false]
	if fe_toggled==true:
		for node in get_tree().get_nodes_in_group("CS_Group"):
			node.visible=cs_toggled
		for node in get_tree().get_nodes_in_group("HS_Group"):
			node.visible=hs_toggled
		for node in get_tree().get_nodes_in_group("FE_Group"):
			node.visible=fe_toggled
		for node in get_tree().get_nodes_in_group("DX_Group"):
			node.visible=dx_toggled
func _on_dx_toggled(dx_toggled: bool) -> void:
	Global.toggle = [false, false, false, true]
	if dx_toggled==true:
		for node in get_tree().get_nodes_in_group("CS_Group"):
			node.visible=cs_toggled
		for node in get_tree().get_nodes_in_group("HS_Group"):
			node.visible=hs_toggled
		for node in get_tree().get_nodes_in_group("FE_Group"):
			node.visible=fe_toggled
		for node in get_tree().get_nodes_in_group("DX_Group"):
			node.visible=dx_toggled

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
		dx.set_instance_shader_parameter("x_rot", x_rot)
		dx.set_instance_shader_parameter("y_rot", y_rot)
		fe.set_instance_shader_parameter("x_rot", x_rot)
		fe.set_instance_shader_parameter("y_rot", y_rot)
		hs.set_instance_shader_parameter("x_rot", x_rot)
		hs.set_instance_shader_parameter("y_rot", y_rot)
		cs.set_instance_shader_parameter("x_rot", x_rot)
		cs.set_instance_shader_parameter("y_rot", y_rot)
		if lerp_val_x > 1 or lerp_val_y > 1:
			_on_mouse_exited()
			
#鼠标离开，重置动效
func _on_mouse_exited() -> void:
		dx.set_instance_shader_parameter("x_rot", 0)
		dx.set_instance_shader_parameter("y_rot", 0)
		fe.set_instance_shader_parameter("x_rot", 0)
		fe.set_instance_shader_parameter("y_rot", 0)
		hs.set_instance_shader_parameter("x_rot", 0)
		hs.set_instance_shader_parameter("y_rot", 0)
		cs.set_instance_shader_parameter("x_rot", 0)
		cs.set_instance_shader_parameter("y_rot", 0)
		if tween_hover and tween_hover.is_running():
			tween_hover.kill()
		tween_hover = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_ELASTIC)
		tween_hover.tween_property(self,"scale",Vector2(1,1),0.5)
		z_index = 0

#点击动效
func _on_button_button_down() -> void:
	tween_click = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BACK)
	tween_click.tween_property(self,"scale",Vector2(1,1),0.1)
func _on_button_button_up() -> void:
	if tween_click and tween_click.is_running():
		tween_click.kill()
	tween_click = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_ELASTIC)
	tween_click.tween_property(self,"scale",Vector2(1.2,1.2),0.3)
