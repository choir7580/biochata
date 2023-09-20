extends Area2D

onready var anim_player: AnimationPlayer = $AnimationPlayer

export var scene: PackedScene

func transition_stage() -> void:
	# warning-ignore:return_value_discarded
	anim_player.play("Fade-In")
	yield(anim_player, "animation_finished")
	get_tree().change_scene_to(scene)
	
func _on_body_entered(_body: Node) -> void:
	transition_stage()
