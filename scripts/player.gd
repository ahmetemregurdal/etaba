extends CharacterBody2D

var acceleration := 1000
var max_speed := 250
var friction := 0.2

var house = null
func setHouse(newhouse):
	if newhouse != null:
		$Keyprompt/AnimationPlayer.play("KeyPrompt")
		$Keyprompt/Key.show()
	else:
		$Keyprompt/AnimationPlayer.stop()
		$Keyprompt/Key.hide()
	house = newhouse

func _ready():
	setHouse(null)

func _unhandled_input(event):
	if event is InputEventKey and event.is_action_pressed("interact") and house != null:
		if Global.player_position == Vector2(-1000000, -1000000):
			Global.player_position = position
		house.enter()

func _physics_process(delta):
	var input_vector := Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector == Vector2(0, 0):
		velocity = velocity.lerp(Vector2(0, 0), friction)
	else:
		velocity += input_vector * acceleration * delta
		velocity.x = clamp(velocity.x, -max_speed, max_speed)
		velocity.y = clamp(velocity.y, -max_speed, max_speed)
	
	move_and_slide()

func _process(delta):
	var input_vector := Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	if input_vector == Vector2.ZERO:
		$AnimatedSprite2D.play("Idle")
	else:
		$AnimatedSprite2D.play("Walking")
	
	if input_vector.x < 0:
		$AnimatedSprite2D.flip_h = true
	elif input_vector.x > 0:
		$AnimatedSprite2D.flip_h = false
