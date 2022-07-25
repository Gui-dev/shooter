extends Sprite


var velocity = 150
var movement = Vector2.ZERO
var shots = preload('res://prefabs/Shots.tscn')
var loaded = true


func _process(delta: float) -> void:
  movement.x = int(Input.is_action_pressed('right')) - int(Input.is_action_pressed('left'))
  movement.y = int(Input.is_action_pressed('down')) - int(Input.is_action_pressed('up'))
    
  global_position += velocity * movement * delta
  
  if Input.is_action_pressed('shooter') and Global.create_parent_node != null and loaded:
    Global.instance_node(shots, global_position, Global.create_parent_node)
    loaded = false
    $load_timer.start()


func _on_load_timer_timeout() -> void:
  loaded = true
