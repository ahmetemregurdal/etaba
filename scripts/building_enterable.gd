extends Node2D

@export_file("*.tscn") var Inside

func _on_doorway_body_entered(body: Node2D) -> void:
	body.setHouse(self)

func _on_doorway_body_exited(body: Node2D) -> void:
	if body.house == self:
		body.setHouse(null)

func enter():
	get_tree().change_scene_to_file(Inside)
