extends Camera2D


var camera_shake_intensity = 0
var init_camera_shake = false


func _ready() -> void:
  Global.camera = self
  

func _process(delta: float) -> void:
  zoom = lerp(zoom, Vector2(1, 1), .3)
  
  if init_camera_shake:
    global_position += Vector2(
      rand_range(-camera_shake_intensity, camera_shake_intensity), 
      rand_range(-camera_shake_intensity, camera_shake_intensity)
    ) * delta
  

func _exit_tree() -> void:
  Global.camera = null
  

func shake_screen(intesity: int, time: float) -> void:
  zoom = Vector2(1, 1) - Vector2(intesity * 0.02, intesity * 0.02)
  camera_shake_intensity = intesity
  $timer_camera.wait_time = time
  $timer_camera.start()
  init_camera_shake = true


func _on_timer_camera_timeout() -> void:
  init_camera_shake = false
