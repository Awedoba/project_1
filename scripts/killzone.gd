extends Area2D

@onready var timer: Timer = $Timer
@onready var hurt: AudioStreamPlayer2D = $AudioStreamPlayer2D

func _on_body_entered(body: Node2D) -> void:
	if !hurt.playing:
		hurt.play()
	print(	"you died")
	Engine.time_scale = .5
	body.get_node("CollisionShape2D").queue_free()
	timer.start()


func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	get_tree().reload_current_scene();
