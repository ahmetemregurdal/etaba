extends Node2D


# Called when the node enters the scene tree for the fhttps://open.spotify.com/album/0XUH04WpLqnB0Q7Hep3aR0irst time.
func _ready() -> void:
	$Player/Camera2D.enabled = true
	if Global.player_position != Vector2(-1000000, -1000000):
		$Player.position = Global.player_position
		Global.player_position = Vector2(-1000000, -1000000)
