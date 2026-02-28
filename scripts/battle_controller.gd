extends Node
class_name BattleController

var unit_queue: Array[UnitRuntime] = []

func add_unit(unit_runtime: UnitRuntime) -> void:
    unit_queue.append(unit_runtime)
    add_child(unit_runtime)

func step() -> Dictionary:
    var cur_unit = unit_queue.pop_front()
    var enemy_unit = unit_queue.pop_front()
    print("[%s] attacked [%s] for [%s] DMG" % [cur_unit, enemy_unit, cur_unit.atk])
    enemy_unit.hp = max(enemy_unit.hp - cur_unit.atk, 0)
    print("[%s] has [%s] HP left" % [enemy_unit, enemy_unit.hp])
    var result = {
        "attacker": cur_unit,
        "defender": enemy_unit,
        "dmg": cur_unit.atk
    }
    unit_queue.append(enemy_unit)
    unit_queue.append(cur_unit)
    return result # for animation