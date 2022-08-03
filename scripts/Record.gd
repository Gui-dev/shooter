extends Label


func _ready() -> void:
  Global.load_game()
  text = String(Global.record)
  

func _process(_delta: float) -> void:
  if Global.score > Global.record:
    Global.record = Global.score
