extends Sprite

signal change_lives(player_lives)

var velocity = 150
var movement = Vector2.ZERO
var shots = preload('res://prefabs/Shots.tscn')
var recharged = true
var max_lives = 3
var lives = max_lives
var dead = false
var recharged_time = 0.1
var standard_recharged_time = recharged_time
var damage = 1
var standard_damage = damage
var reset_power = []


func _ready() -> void:
  Global.player = self
  connect('change_lives', get_parent().get_node('ui/controls'), 'on_change_player_lives')
  emit_signal('change_lives', max_lives)
  Global.damage_player_background = get_parent().get_node('ui/controls/damage_player')


func _process(delta: float) -> void:
  movement.x = int(Input.is_action_pressed('right')) - int(Input.is_action_pressed('left'))
  movement.y = int(Input.is_action_pressed('down')) - int(Input.is_action_pressed('up'))
  
  global_position.x = clamp(global_position.x, 24, 616)
  global_position.y = clamp(global_position.y, 24, 336)
    
  if !dead:
    global_position += velocity * movement * delta
  
  if Input.is_action_pressed('shooter') and Global.create_parent_node != null and recharged and !dead:
    var shooter = Global.instance_node(shots, global_position, Global.create_parent_node)
    shooter.damage = damage
    recharged = false
    $load_timer.start()


func _exit_tree() -> void:
  Global.player = null


func _on_load_timer_timeout() -> void:
  recharged = true
  $load_timer.wait_time = recharged_time 


func _on_hitbox_area_entered(area: Area2D) -> void:
  if area.is_in_group('enemy'):
    lives -= 1
    emit_signal('change_lives', lives)
    Global.damage_player_background.visible = true
    yield(get_tree().create_timer(0.1), 'timeout')
    Global.damage_player_background.visible = false
    
    if lives <= 0:
      visible = false
      dead = true
      yield(get_tree().create_timer(1), 'timeout')
      get_tree().reload_current_scene()
      Global.save_game()


func _on_powerup_timer_timeout() -> void:
  modulate = Color('1a6bd2')
  if reset_power.find('load_timer') != null:
    recharged_time = standard_recharged_time
    reset_power.erase('load_timer')
  
  if reset_power.find('damage') != null:
    damage = standard_damage
    reset_power.erase('damage')
