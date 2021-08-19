extends MeshInstance


var a = 0
onready var ray_c = get_node("RayCast")
# Called when the node enters the scene tree for the first time.
func _ready():
	
	ray_roll()
	pass # Replace with function body.

func ray_roll():
	if ray_c.is_colliding():
		print("collie")
		
	else:
		self.global_transform.origin.y += 0.1
		return
	pass
	
func _process(_delta):
	if ray_c.is_colliding() == false:
		ray_roll()
	pass
