extends Button

export(String, FILE) var scene_path: String = ""

func _on_button_up() -> void:
	# warning-ignore:return_value_discarded
	get_tree().change_scene(scene_path)
	pass
