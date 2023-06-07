extends Sprite


func _ready():
	$anim_brilho.play("brilho")
	pass


func _on_anim_brilho_animation_finished(anim_name):
	queue_free()
