extends TextureRect

const CONTACT = preload("res://scenes/contact.tscn")
@onready var v_box: VBoxContainer = $".."
@onready var contact: TextureRect = $"."

var instance
func _on_mouse_entered() -> void:
	self.hide()
	instance = CONTACT.instantiate()
	v_box.add_child(instance)
	instance.exit_contact_container.connect(_on_exit_contact_container)
	
func _on_exit_contact_container():
	self.visible=true
	instance.queue_free()
