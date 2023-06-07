extends Area2D

export var vel = 500


func _ready():
	
	pass

func _process(delta):
	
	position.y -= vel * delta 
	
	if position.y < -50:
		queue_free()
		
