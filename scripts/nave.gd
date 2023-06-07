extends KinematicBody2D

export var vel = 500
var pre_laser = preload ("res://scenes/laser.tscn")
var pre_brilho = preload("res://scenes/brilho.tscn")

var especial = false #para habilitar o especial da arma 
var tempo_especial = 8 #tempo para desabilitar a arma especial
var tempo_instancia_laser = 0 

func _ready():
	
	pass 



func _process(delta):
	
	var dir = Vector2()
	
	
	if especial: #ser for verdadeira, eu abro a contagem regressiva 
		tempo_especial -= delta 
		tempo_instancia_laser += delta
		if tempo_instancia_laser > .4:
			LaserEsquerdo()
			BrilhoEspecial($pos_esq)
			LaserDireito()
			BrilhoEspecial($pos_dir)
			tempo_instancia_laser = 0 
			
		
	
	if tempo_especial < 0:
		especial = false 
		tempo_especial = 8	
	
#	print(especial)
#	print(tempo_especial)
	
	
	
	if Input.is_action_pressed("left") and position.x > 50:
		dir.x -= 1
	if Input.is_action_pressed("right") and position.x < 460:
		dir.x += 1
	
	if Input.is_action_pressed("up") and position.y > 50:
		dir.y -= 1
	if Input.is_action_pressed("down")and position.y < 755:
		dir.y += 1
		print(Input)
	
	
	#limitar movimento da nave            #OU ⬆ 
#	if position.x < 50:
#		position.x = 50
#	if position.x > 460:
#		position.x = 460
#
#	if position.y < 50:
#		position.y = 50
#	if position.y > 755:
#		position.y = 755
	
	move_and_slide(dir * vel)

func _input(event): 
	if Input.is_action_just_pressed("shooter") and get_tree().get_nodes_in_group("tiro").size() < 4: 
		Laser()
		Brilho()

func Laser():
	var l = pre_laser.instance()
	l.position = $pos.global_position
	get_parent().add_child(l)
	l.add_to_group("tiro")
	


func LaserEsquerdo():
	var l = pre_laser.instance()
	l.position = $pos_esq.global_position
	get_parent().add_child(l)
	l.add_to_group("tiro")
	l.add_to_group("especial")
	


func LaserDireito():
	var l = pre_laser.instance()
	l.position = $pos_dir.global_position
	get_parent().add_child(l)
	l.add_to_group("tiro")
	l.add_to_group("especial")
	

func Brilho():
	var b = pre_brilho.instance()
	b.position = $pos.global_position
	get_parent().add_child(b)
	
	
func BrilhoEspecial(posbrilho):
	var b = pre_brilho.instance()
	b.position = posbrilho.global_position
	get_parent().add_child(b)

func _on_area_area_entered(area):
	if area.name == "powerup":
		especial = true
		area.queue_free()
	

