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

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		tween.interpolate_property($ColorRect, "self_modulate:a", 0.5, 0.0, 0.25, Tween.TRANS_CUBIC, Tween.EASE_OUT)	
		tween.interpolate_property($Difficulties, "rect_position:x", x, x+200, 0.5, Tween.TRANS_CUBIC, Tween.EASE_OUT)
		var scene: Node2D = get_tree().current_scene
		var menu_container: Control = scene.get_child(5)
		menu_container.get_child(1).interpolate_property(menu_container, "rect_position:x", -225, 0, 0.5, Tween.TRANS_CIRC, Tween.EASE_OUT)
		menu_container.get_child(0).get_child(0).grab_focus()
		scene.remove_child(self)
	
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
