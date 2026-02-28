extends Resource
class_name Unit

@export_placeholder("Wolf") var name_id: String = ""
@export var hp: int = 10
@export var atk: int = 1
@export var is_enemy: bool = true
@export var texture: Texture2D
var unit_prefab: UnitPrefab

func _to_string() -> String:
    return name_id