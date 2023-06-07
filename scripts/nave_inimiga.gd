extends Area2D


export var vel = 300
var pre_explosao = preload ("res://scenes/explosao.tscn")


func _ready():
	pass

func _process(delta):
	
	position.y += vel * delta
	
	if position.y > 900:
		queue_free()


func _on_nave_inimiga_area_entered(area):
	Pontos()
	
	if area.is_in_group("tiro"):
		Explosao()
		queue_free() #nave inimiga
		area.queue_free() #laser
		
	if area.is_in_group("especial"):
		Explosao()
		queue_free()
		area.queue_free()
		
	

func Explosao():
	var e = pre_explosao.instance()
	e.position = position
	get_parent().add_child(e)
	
	
func Pontos():
	get_parent().score += 10	
	


func _on_nave_inimiga_body_entered(body):
	print(body.name)
	if Area2D.collision_layer == 2:
		Explosao()
		yield(get_tree().create_timer(.6),"timeout")
		queue_free()
  
