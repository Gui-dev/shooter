extends Node


var create_parent_node: Node = null
var player = null
var score = 0
var record = 0
var camera = null
var damage_player_background = null


func instance_node(node: PackedScene, location: Vector2, parent: Node2D) -> Node:
  var node_instance = node.instance()
  parent.add_child(node_instance)
  node_instance.global_position = location  

  return node_instance


func save() -> Dictionary:
  var dictionary_save = {
    "record": record
  }
  
  return dictionary_save


func save_game() -> void:
  var save_game = File.new()
  save_game.open_encrypted_with_pass('user://savegame.save', File.WRITE, 'cript')
  save_game.store_line(to_json(save()))
  save_game.close()
  

func load_game() -> void:
  var save_game = File.new()
  
  if not save_game.file_exists('user://savegame.save'):
    print('Erro ao carregar o arquivo')
    return
  
  save_game.open_encrypted_with_pass('user://savegame.save', File.READ, 'cript')
  var current_line = parse_json(save_game.get_line())
  record = current_line['record']
  save_game.close()
