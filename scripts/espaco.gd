extends Node2D

var pre_inimiga = preload("res://scenes/nave_inimiga.tscn" )
var tempo = 0
var tempo_powerup = 0
var pre_powerup = preload("res://scenes/powerup.tscn" )
onready var pontos = $label
export var score = 0



func _ready():
	pass

func _process(delta):
	pontos.text = "Pontos: " + str(score)
	
	#tempo para instanciar o powerup
	tempo_powerup += delta
	if tempo_powerup > rand_range(9,15):
		Powerup()
		tempo_powerup = 0
	
	
	#tempo para instanciar as nave inimigas 
	tempo += delta 
	if tempo > rand_range(.8,2):
		Inimigo()
		tempo = 0
 
	
func Inimigo():
	var i = pre_inimiga.instance()
	i.position = Vector2(rand_range(50,470), -100)
	i.vel = rand_range(300,700)
	add_child(i)


func Powerup():
	var pwup = pre_powerup.instance()
	pwup.position = Vector2(rand_range(50,470),-50)
	add_child(pwup)
	pass
