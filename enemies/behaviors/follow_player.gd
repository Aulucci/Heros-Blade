extends Node

# : float serve para definitr que o numero é decimal
@export var speed: float = 1

#@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
var enemy: Enemy
var sprite: AnimatedSprite2D

func _ready():
	enemy = get_parent()
	sprite = enemy.get_node("AnimatedSprite2D")
	pass

func _physics_process(delta: float) -> void:
	# Ignorar GameOver
	if GameManager.is_game_over: return
	
	#Calcular direção
	var player_position = GameManager.player_position
	var difference = player_position - enemy.position
	var input_vector = difference.normalized()
	
	#movimento
	enemy.velocity = input_vector * speed * 100.0
	enemy.move_and_slide()
	
	#Girar Srpite
	if input_vector.x > 0:
		# desmarcar flip_h do Sprite2D
		sprite.flip_h = false
	elif input_vector.x < 0:
		# marcar flip_h do Sprite2D
		sprite.flip_h = true
