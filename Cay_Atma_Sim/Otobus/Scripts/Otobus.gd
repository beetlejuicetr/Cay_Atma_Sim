extends KinematicBody
var velocity = Vector3(0,0,0)
export (int) var speed = 5


func _ready():
	pass
func _hareket():
	velocity = Vector3.ZERO
	velocity.z += speed
	
	pass
func _physics_process(_delta):
	_hareket()
	_cay_at()
	velocity = move_and_slide(velocity)
	pass
var cay0 = preload("res://Probs/Caylar/Cay0/Cay0.tscn")
func _cay_at():
	if Input.is_action_just_pressed("ui_select"):
		var cy = cay0.instance()
		cy.global_transform = $uzun_adam/Position3D.global_transform
		get_parent().add_child(cy)
		cy.apply_central_impulse(Vector3(-10,0,10))
		pass
	pass
