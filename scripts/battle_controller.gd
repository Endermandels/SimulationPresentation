extends Node
class_name BattleController

@export var unit_queue: Array[Unit] = []

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