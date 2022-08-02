extends Control


var size_lives = 20


func _ready() -> void:
  pass


func on_change_player_lives(player_lives) -> void:
  $lives.rect_size.x = player_lives * size_lives
