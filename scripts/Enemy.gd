extends Sprite


var velocity = 75
var movement = Vector2.ZERO
var stunned = false
var retreat = 6
var health_points = 3
var blood_particle = preload('res://prefabs/BloodParticle.tscn')


func _process(delta: float) -> void:
  if Global.player != null and !stunned:
    movement = global_position.direction_to(Global.player.global_position)
  elif stunned:
    movement = lerp(movement, Vector2.ZERO, 0.3)
    
  global_position += movement * velocity * delta
  
  if health_points <= 0 and Global.create_parent_node != null:
    if Global.camera != null:
      Global.camera.shake_screen(50, 0.1)
    
    Global.score += 10
    var instance_blood_particle = Global.instance_node(blood_particle, global_position, Global.create_parent_node)
    instance_blood_particle.rotation = movement.angle()
    queue_free()


func _on_hitbox_area_entered(area: Area2D) -> void:
  if area.is_in_group('damage') and !stunned:  
    modulate = Color.white
    area.get_parent().queue_free()
    movement = -movement * retreat
    stunned = true
    health_points -= 1
    $time_retreat.start()


func _on_time_retreat_timeout() -> void:
  modulate = Color('f3066a')
  stunned = false
