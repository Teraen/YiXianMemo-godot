extends Button

func _ready():
	visible = Global.DetailMode
	var labels = get_tree().current_scene.find_children("display", "Label", true)
	for label in labels:
		label.add_to_group("labels", true)
		
func _process(delta: float) -> void:
	visible = Global.DetailMode
	if Global.DetailMode == true:
		text = str(sum_visible_labels())
			
func sum_visible_labels():
	var total_sum = 0
	for label in get_tree().get_nodes_in_group("labels"):
		if label.visible:  # 只计算可见的 Label
			var number = int(label.text)  # 读取文本并转换为整数
			total_sum += number
	return total_sum
