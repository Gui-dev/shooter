extends Label


func _ready() -> void:
  text = String(Global.record)
  

func _process(_delta: float) -> void:
  if Global.score > Global.record:
    Global.record = Global.score
