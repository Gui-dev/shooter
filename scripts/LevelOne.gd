extends Node2D


export(Array, PackedScene) var enemies
export(Array, PackedScene) var powers


func _ready() -> void:
  Global.create_parent_node = self
  Global.score = 0
  Global.game_state = true
  

func _exit_tree() -> void:
  Global.create_parent_node = null


func _on_timer_spawn_enemy_timeout() -> void:
  var enemy_position = Vector2(rand_range(-160, 670), rand_range(-90, 300))
  
  while enemy_position.x < 640 and enemy_position.x > -80 and enemy_position.y < 360 and enemy_position.y > -45:
    enemy_position = Vector2(rand_range(-160, 670), rand_range(-90, 300))
  
  var enemies_numbers = round(rand_range(0, enemies.size() - 1))
  Global.instance_node(enemies[enemies_numbers], enemy_position, self)


func _on_timer_increase_difficulty_timeout() -> void:
  if $timer_spawn_enemy.wait_time > 0.50:
    $timer_spawn_enemy.wait_time -= 0.10


func _on_timer_spawn_powerup_timeout() -> void:
  var position_powers = Vector2(rand_range(0, 640), rand_range(0, 320))
  
  var number_powers = round(rand_range(-1, powers.size() - 1))
  Global.instance_node(powers[number_powers], position_powers, self)
