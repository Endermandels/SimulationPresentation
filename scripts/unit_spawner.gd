extends Node2D
class_name UnitSpawner

const UNIT_PREFAB = preload("res://scenes/unit.tscn")

@export var spawn_points: Node2D
@export var battle_controller: BattleController

func _ready() -> void:
	for u in battle_controller.unit_queue:
		var unit_prefab = UNIT_PREFAB.instantiate()
		unit_prefab.sprite.texture = u.texture
		u.unit_prefab = unit_prefab
		if u.is_enemy:
			unit_prefab.sprite.flip_h = true
		for sp: Node2D in spawn_points.get_children():
			if sp.get_child_count() < 1:
				sp.add_child(unit_prefab)
				break
