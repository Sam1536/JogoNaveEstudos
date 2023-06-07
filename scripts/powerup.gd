extends Area2D

export var vel = 300

func _ready():
	pass

func _physics_process(delta):
	position.y += vel * delta
	
	if position.y > 900:
		queue_free()
