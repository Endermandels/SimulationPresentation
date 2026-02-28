extends Saveable
class_name UnitRuntime

var name_id: String
var hp: int
var atk: int
var unit_prefab: UnitPrefab

func _ready() -> void:
    SaveManager.register(self)

func _exit_tree() -> void:
    SaveManager.unregister(self)

func _init(unit: Unit, prefab: UnitPrefab) -> void:
    name_id = unit.name_id
    hp = unit.base_hp
    atk = unit.atk
    unit_prefab = prefab

func _to_string() -> String:
    return name_id

func get_save_data() -> Dictionary:
    return { "name": name_id, "hp": hp, "atk": atk }

func load_save_data(data: Dictionary) -> void:
    name_id = data.name
    hp = data.hp
    atk = data.atk
