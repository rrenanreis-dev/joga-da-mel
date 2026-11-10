extends CharacterBody2D

# Velocidade de movimento do navio em pixels por segundo
@export var speed: float = 200.0

# Referência automática para o nó AnimatedSprite2D filho
@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	# Captura as entradas do teclado (WASD ou setas direcionais)
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	# Aplica a velocidade e executa a movimentação com colisão integrada
	velocity = direction * speed
	move_and_slide()
	
	# Sistema de controlo das animações com base na direção
	if direction != Vector2.ZERO:
		animated_sprite.play()
		
		# Se o movimento vertical for maior que o horizontal
		if abs(direction.y) > abs(direction.x):
			if direction.y < 0:
				# A ir para cima (o topo da linha do spritesheet de costas ou frente ajustado)
				animated_sprite.animation = "cima"
				animated_sprite.flip_h = false
			else:
				# A ir para baixo
				animated_sprite.animation = "baixo"
				animated_sprite.flip_h = false
		# Movimento horizontal (lado)
		else:
			animated_sprite.animation = "lado"
			# Ajusta a orientação horizontal do sprite conforme o movimento
			animated_sprite.flip_h = (direction.x > 0)
	else:
		# Se o jogador soltar as teclas, para a animação do navio
		animated_sprite.stop()
