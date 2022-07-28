extends Node


var create_parent_node: Node = null
var player = null
var score = 0
var record = 0
var camera = null


func instance_node(node: PackedScene, location: Vector2, parent: Node2D) -> Node:
  var node_instance = node.instance()
  parent.add_child(node_instance)
  node_instance.global_position = location  

  return node_instance
