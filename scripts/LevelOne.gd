extends Node2D


var enemy_one = preload('res://scenes/Enemy.tscn')


func _ready() -> void:
  Global.create_parent_node = self
  Global.score = 0
  

func _exit_tree() -> void:
  Global.create_parent_node = null


func _on_timer_spawn_enemy_timeout() -> void:
  var enemy_position = Vector2(rand_range(-160, 670), rand_range(-90, 300))
  
  while enemy_position.x < 640 and enemy_position.x > -80 and enemy_position.y < 360 and enemy_position.y > -45:
    enemy_position = Vector2(rand_range(-160, 670), rand_range(-90, 300))
  
  Global.instance_node(enemy_one, enemy_position, self)
