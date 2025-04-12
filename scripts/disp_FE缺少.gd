extends Label

@onready var fe: TextureRect = $"../CenterContainer/FE"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = !Global.toggle[2]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if fe.visible:
		visible = false
	else:
		visible = true
