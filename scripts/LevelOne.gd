extends Node2D


func _ready() -> void:
  Global.create_parent_node = self
  

func _exit_tree() -> void:
  Global.create_parent_node = null
