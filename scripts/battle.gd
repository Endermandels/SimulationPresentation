extends Node2D
class_name Battle

@export var battle_controller: BattleController
@export var animation_controller: AnimationController

func _ready() -> void:
    SaveManager.load_game()

func _process(_delta: float) -> void:
    if Input.is_action_just_pressed("select") and animation_controller.done_animating:
        var res = battle_controller.step()
        animation_controller.animate_attack(res)
    if Input.is_action_just_pressed("save"):
        SaveManager.save_game()