extends Sprite


var velocity = 150
var movement = Vector2.ZERO
var shots = preload('res://prefabs/Shots.tscn')
var recharged = true
var dead = false


func _ready() -> void:
  Global.player = self


func _process(delta: float) -> void:
  movement.x = int(Input.is_action_pressed('right')) - int(Input.is_action_pressed('left'))
  movement.y = int(Input.is_action_pressed('down')) - int(Input.is_action_pressed('up'))
  
  global_position.x = clamp(global_position.x, 24, 616)
  global_position.y = clamp(global_position.y, 24, 336)
    
  if !dead:
    global_position += velocity * movement * delta
  
  if Input.is_action_pressed('shooter') and Global.create_parent_node != null and recharged and !dead:
    Global.instance_node(shots, global_position, Global.create_parent_node)
    recharged = false
    $load_timer.start()


func _exit_tree() -> void:
  Global.player = null


func _on_load_timer_timeout() -> void:
  recharged = true


func _on_hitbox_area_entered(area: Area2D) -> void:
  if area.is_in_group('enemy'):
    visible = false
    dead = true
    yield(get_tree().create_timer(1), 'timeout')
    get_tree().reload_current_scene()
