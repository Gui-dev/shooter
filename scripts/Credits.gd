extends Control


func _ready() -> void:
  pass


func _on_button_go_back_pressed() -> void:
  if get_tree().change_scene("res://scenes/StartScreen.tscn") != OK:
    print('Error')
