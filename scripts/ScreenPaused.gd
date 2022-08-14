extends CanvasLayer


func _ready() -> void:
  self.visible = false
#  show(false)
#
#
#func _input(event: InputEvent) -> void:
#  if event.is_action_pressed('ui_cancel'):
#    if Global.game_state:
#      show(!get_tree().paused)
#      get_tree().paused = !get_tree().paused
#
#
#func show(is_visible: bool) -> void:
#  for node in get_children():
#    node.visible = is_visible
#
#
#func _on_button_continue_pressed() -> void:
#  show(false)
#  get_tree().paused = false
