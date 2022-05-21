extends Control

onready var tween: Tween = get_node("Tween")
onready var terminating: bool = false

func exit() -> void:
	terminating = true
	get_tree().quit()

func _ready() -> void:
	tween.interpolate_property(self, "rect_position:x", 0, 200, 0.5, Tween.TRANS_CIRC, Tween.EASE_OUT)
	$VBoxContainer/start.grab_focus()

func _process(_delta) -> void:
	if terminating: return
	if Input.is_action_just_pressed("ui_cancel"):
		if $VBoxContainer/quit.has_focus():
			exit()
		else: $VBoxContainer/quit.grab_focus()

func _on_start_pressed() -> void:
	var start: Control = load("res://scenes/menu_start.tscn").instance()
	tween.interpolate_property(self, "rect_position:x", 200, 0, 0.5, Tween.TRANS_CIRC, Tween.EASE_OUT)
	get_tree().current_scene.add_child(start)
	get_tree().current_scene.remove_child(self)
	queue_free()
func _on_options_pressed():
	pass

func _on_credit_pressed():
	pass

func _on_quit_pressed():
	exit()

func menu_focus(node) -> void:
	if terminating: return
	tween.interpolate_property(node, "rect_position:x", 0, 15, 0.25, Tween.TRANS_CIRC, Tween.EASE_OUT)
	tween.start()

func menu_unfocus(node) -> void:
	if terminating: return
	tween.interpolate_property(node, "rect_position:x", 15, 0, 0.25, Tween.TRANS_CIRC, Tween.EASE_OUT)
	tween.start()

func _on_start_focus_entered() -> void:
	menu_focus($VBoxContainer/start)

func _on_start_focus_exited() -> void:
	menu_unfocus($VBoxContainer/start)

func _on_options_focus_entered() -> void:
	menu_focus($VBoxContainer/options)

func _on_options_focus_exited() -> void:
	menu_unfocus($VBoxContainer/options)

func _on_quit_focus_entered() -> void:
	menu_focus($VBoxContainer/quit)

func _on_credit_focus_entered() -> void:
	menu_focus($VBoxContainer/credit)

func _on_credit_focus_exited() -> void:
	menu_unfocus($VBoxContainer/credit)

func _on_quit_focus_exited() -> void:
	menu_unfocus($VBoxContainer/quit)

func _notification(what) -> void:
	if (what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST):
		exit()
