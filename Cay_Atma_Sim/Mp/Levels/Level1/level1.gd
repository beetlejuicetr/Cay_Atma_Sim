extends Spatial
onready var vs = get_node("VisibilityNotifier")
func _ready():
	vs.connect("screen_exited",self,"_kamera_cikti")
	pass

func _kamera_cikti():
	get_parent()._create_level()
	queue_free()
	print("öldü")
	pass
