extends Control

onready var tween: Tween = get_node("Tween")
onready var x: float = get_viewport_rect().size.x/2 - $Difficulties.rect_size.x/2
onready var c_size: float = $Difficulties.rect_size.y
onready var y_pos: float = get_viewport_rect().size.y/2 - $Difficulties.rect_size.y/2

func _ready() -> void:
	$Difficulties.rect_position.y = y_pos
	tween.interpolate_property($ColorRect, "self_modulate:a", 0.0, 0.5, 0.25, Tween.TRANS_CUBIC, Tween.EASE_OUT)	
	tween.interpolate_property($Difficulties, "rect_position:x", x + 200, x, 0.5, Tween.TRANS_CUBIC, Tween.EASE_OUT)
	$Difficulties/easy.grab_focus()

func _process(_delta) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		tween.interpolate_property($ColorRect, "self_modulate:a", 0.5, 0.0, 0.25, Tween.TRANS_CUBIC, Tween.EASE_OUT)	
		tween.interpolate_property($Difficulties, "rect_position:x", x, x+200, 0.5, Tween.TRANS_CUBIC, Tween.EASE_OUT)
		var menu: Control = load("res://scenes/menu.tscn").instance()
		get_tree().current_scene.add_child(menu)
		get_tree().current_scene.remove_child(self)
		queue_free()
	
func _on_easy_focus_entered() -> void:
	tween.interpolate_property($Difficulties/easy, "rect_position:y", $Difficulties/easy.rect_position.y, 38, 0.25, Tween.TRANS_CIRC, Tween.EASE_OUT)
	tween.interpolate_property($Difficulties/normal, "rect_position:y", $Difficulties/normal.rect_position.y, 172, 0.25, Tween.TRANS_CIRC, Tween.EASE_OUT)
	tween.interpolate_property($Difficulties/hard, "rect_position:y", $Difficulties/hard.rect_position.y, 278, 0.25, Tween.TRANS_CIRC, Tween.EASE_OUT)
	tween.interpolate_property($Difficulties/lunatic, "rect_position:y", $Difficulties/lunatic.rect_position.y, 384, 0.25, Tween.TRANS_CIRC, Tween.EASE_OUT)
	tween.start()

func _on_normal_focus_entered() -> void:
	tween.interpolate_property($Difficulties/easy, "rect_position:y", $Difficulties/easy.rect_position.y, 0, 0.25, Tween.TRANS_CIRC, Tween.EASE_OUT)
	tween.interpolate_property($Difficulties/normal, "rect_position:y", $Difficulties/normal.rect_position.y, 139, 0.25, Tween.TRANS_CIRC, Tween.EASE_OUT)
	tween.interpolate_property($Difficulties/hard, "rect_position:y", $Difficulties/hard.rect_position.y, 278, 0.25, Tween.TRANS_CIRC, Tween.EASE_OUT)
	tween.interpolate_property($Difficulties/lunatic, "rect_position:y", $Difficulties/lunatic.rect_position.y, 384, 0.25, Tween.TRANS_CIRC, Tween.EASE_OUT)
	tween.start()
	
func _on_hard_focus_entered() -> void:
	tween.interpolate_property($Difficulties/easy, "rect_position:y", $Difficulties/easy.rect_position.y, 0, 0.25, Tween.TRANS_CIRC, Tween.EASE_OUT)
	tween.interpolate_property($Difficulties/normal, "rect_position:y", $Difficulties/normal.rect_position.y, 106, 0.25, Tween.TRANS_CIRC, Tween.EASE_OUT)
	tween.interpolate_property($Difficulties/hard, "rect_position:y", $Difficulties/hard.rect_position.y, 245, 0.25, Tween.TRANS_CIRC, Tween.EASE_OUT)
	tween.interpolate_property($Difficulties/lunatic, "rect_position:y", $Difficulties/lunatic.rect_position.y, 384, 0.25, Tween.TRANS_CIRC, Tween.EASE_OUT)
	tween.start()

func _on_lunatic_focus_entered() -> void:
	tween.interpolate_property($Difficulties/easy, "rect_position:y", $Difficulties/easy.rect_position.y, 0, 0.25, Tween.TRANS_CIRC, Tween.EASE_OUT)
	tween.interpolate_property($Difficulties/normal, "rect_position:y", $Difficulties/normal.rect_position.y, 106, 0.25, Tween.TRANS_CIRC, Tween.EASE_OUT)
	tween.interpolate_property($Difficulties/hard, "rect_position:y", $Difficulties/hard.rect_position.y, 212, 0.25, Tween.TRANS_CIRC, Tween.EASE_OUT)
	tween.interpolate_property($Difficulties/lunatic, "rect_position:y", $Difficulties/lunatic.rect_position.y, 351, 0.25, Tween.TRANS_CIRC, Tween.EASE_OUT)
	tween.start()
