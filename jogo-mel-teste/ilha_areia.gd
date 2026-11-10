extends Area2D

# Função chamada quando o player entra na área da ilha de areia
func _on_body_entered(body: Node2D) -> void:
	# Verifica se quem encostou é o player
	if body.name == "CharacterBody2D":
		get_tree().change_scene_to_file("res://ilha_areia.tscn")
