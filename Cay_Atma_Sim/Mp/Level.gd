extends Spatial

var levels = {"level1":preload("res://Mp/Levels/Level1/level1.tscn"),
				"level2":preload("res://Mp/Levels/Level1/level1.tscn")}

var pos_z = 0
func _ready():
	for i in 3:
		_create_level()
		i +=1
		pass
	pass
func _create_level():
	var levl1 = levels.level1.instance()
	add_child(levl1)
	levl1.global_transform.origin = Vector3(0,0,pos_z)
	pos_z += 35
	pass


