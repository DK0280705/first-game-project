extends Control

onready var tween = get_node("Tween")
onready var terminating: bool = false

func exit():
	terminating = true
	get_tree().quit()

func _ready():
	$VBoxContainer/start.grab_focus()

func _input(event):
	if terminating: return
	if event.is_action_pressed("ui_cancel"):
		if $VBoxContainer/quit.has_focus():
			exit()
		else: $VBoxContainer/quit.grab_focus()

func _on_start_pressed():
	var start: Node = load("res://scenes/menu_start.tscn").instance()
	tween.interpolate_property(self, "rect_position:x", 0, -225, 0.5, Tween.TRANS_CIRC, Tween.EASE_OUT)
	get_tree().current_scene.add_child(start)

func _on_options_pressed():
	pass

func _on_credit_pressed():
	pass

func _on_quit_pressed():
	exit()

func menu_focus(node):
	if terminating: return
	tween.interpolate_property(node, "rect_position:x", 0, 15, 0.25, Tween.TRANS_CIRC, Tween.EASE_OUT)
	tween.start()

func menu_unfocus(node):
	if terminating: return
	tween.interpolate_property(node, "rect_position:x", 15, 0, 0.25, Tween.TRANS_CIRC, Tween.EASE_OUT)
	tween.start()

func _on_start_focus_entered():
	menu_focus($VBoxContainer/start)

func _on_start_focus_exited():
	menu_unfocus($VBoxContainer/start)

func _on_options_focus_entered():
	menu_focus($VBoxContainer/options)

func _on_options_focus_exited():
	menu_unfocus($VBoxContainer/options)

func _on_quit_focus_entered():
	menu_focus($VBoxContainer/quit)

func _on_credit_focus_entered():
	menu_focus($VBoxContainer/credit)

func _on_credit_focus_exited():
	menu_unfocus($VBoxContainer/credit)

func _on_quit_focus_exited():
	menu_unfocus($VBoxContainer/quit)

func _notification(what):
	if (what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST):
		exit()
