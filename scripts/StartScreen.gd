extends Control


func _ready() -> void:
  pass


func _on_button_credits_pressed() -> void:
  if get_tree().change_scene('res://scenes/Enemy.tscn') != OK:
    print('Error')


func _on_button_start_pressed() -> void:
  if get_tree().change_scene('res://levels/LevelOne.tscn') != OK:
    print('Error')
