extends "res://scripts/building_enterable.gd"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Player/Camera2D.enabled = false
