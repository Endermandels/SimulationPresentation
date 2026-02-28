extends Node
class_name AnimationController

func animate_attack(result: Dictionary) -> void:
	var attacker: UnitPrefab = result.attacker.unit_prefab
	var defender: UnitPrefab = result.defender.unit_prefab
	var start_pos = attacker.global_position
	var tween = create_tween()

	print("Animate!")
	tween.tween_property(attacker, "global_position", defender.global_position, 0.15)
	tween.tween_property(attacker, "global_position", start_pos, 0.25)