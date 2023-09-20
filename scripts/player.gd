extends Actor

var velocity: Vector2 = Vector2.ZERO
var direction: Vector2 = Vector2.ZERO
export(float) var base_speed: float = 100.0

func update_direction() -> void:
	direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	pass

func update_velocity() -> void:
#	velocity.x = 0
#	if Input.is_action_pressed("move_right"):
#		velocity.x += 1
#	if Input.is_action_pressed("move_left"):
#		velocity.x -= 1
#	velocity = move_and_slide(velocity * base_speed)
	velocity = move_and_slide(base_speed * direction)
	pass

onready var _anim_player = $AnimationPlayer

func animate_walking() -> void:
	match int(direction.x):
		1:
			_anim_player.play("Walk-Right")
		-1:
			_anim_player.play("Walk-Left")
		_:
			_anim_player.play("Idle")
#	if velocity.x > 0:
#		_anim_player.play("Walk-Right")
#	if velocity.x < 0:
#		_anim_player.play("Walk-Left")
#	if velocity.x == 0:
#		_anim_player.play("Idle")
	pass

func _physics_process(_delta: float) -> void:
	update_direction()
	update_velocity()
	animate_walking()
	pass
