extends Sprite

var velocity = 250
var movement = Vector2(1, 0)
var one_way = true


func _process(delta: float) -> void:
  if one_way:
    look_at(get_global_mouse_position())
    one_way = false

  global_position += movement.rotated(rotation) * velocity * delta


func _on_notifier_screen_exited() -> void:
  queue_free()
