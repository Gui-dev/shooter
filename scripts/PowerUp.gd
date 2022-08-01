extends Sprite


export(String) var modify_power
export(float) var power_value
export(float) var power_recharge_time = 2


func _on_hitbox_area_entered(area: Area2D) -> void:
  if area.is_in_group('player'):
    area.get_parent().set(modify_power, power_value)
    area.get_parent().get_node('powerup_timer').wait_time = power_recharge_time
    area.get_parent().get_node('powerup_timer').start()
    area.get_parent().reset_power.append(name)
    queue_free()
