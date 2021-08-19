extends Spatial

export (int) var Agac_Sayisi = 50
var agaclar = preload("res://Mp/Levels/Level1/agac.tres")
const agac_kontrol = preload("res://Mp/Levels/Level1/agac_kontrol.gd")

#vector değişkenleri
var sag = {"x":4.0,"y":-1.0,"z":6.8,
			"sinir_x":6.0,"sinir_y":-1.0,"sinir_z":7}
var sol = {"x":-9,"y":-1.0,"z":6.8,
			"sinir_x":-7,"sinir_y":-1.0,"sinir_z":10}

var rng = RandomNumberGenerator.new()
var sag_bittimi= false
func _ready():
	
	print(agaclar.get_item_list())
	for i in Agac_Sayisi:
		if sag.z <= -35: 
			i = Agac_Sayisi
			_sol()
			print("bitti")
			break
		else:
			rng.randomize()
			var random_x = rng.randf_range(sag.x,sag.sinir_x)
			rng.randomize()
			var random_y = rng.randi_range(sag.y,sag.sinir_y)
			rng.randomize()
			var hangi_mesh = rng.randi_range(0,2)
			var random_z = rng.randi_range(sag.z,sag.sinir_z)
			var agc = MeshInstance.new()
			var rayc = RayCast.new()
			rayc.name = "RayCast"
			rayc.cast_to.y = -5
			rayc.enabled = true
			rayc.transform.origin = Vector3(0,-0.1,0)
			agc.mesh = agaclar.get_item_mesh(hangi_mesh)
			agc.set_script(agac_kontrol)
			agc.add_child(rayc)
			add_child(agc)
			agc.global_transform.origin = Vector3(random_x,random_y,random_z)
			sag.z -= 1.5
			sag.sinir_z -= 1.5
			i += 1 
		pass
	pass 

func _sol():
	for i in Agac_Sayisi:
		if sol.z <= -35: 
			i = Agac_Sayisi
			print("bitti2")
			break
		else:
			rng.randomize()
			var random_x = rng.randf_range(sol.x,sol.sinir_x)
			rng.randomize()
			var random_y = rng.randi_range(sol.y,sol.sinir_y)
			rng.randomize()
			var hangi_mesh = rng.randi_range(0,2)
			var random_z = rng.randi_range(sol.z,sol.sinir_z)
			var agc = MeshInstance.new()
			var rayc = RayCast.new()
			rayc.name = "RayCast"
			rayc.cast_to.y = -5
			rayc.enabled = true
			rayc.transform.origin = Vector3(0,-0.1,0)
			agc.mesh = agaclar.get_item_mesh(hangi_mesh)
			agc.set_script(agac_kontrol)
			agc.add_child(rayc)
			add_child(agc)
			agc.global_transform.origin = Vector3(random_x,random_y,random_z)
			sol.z -= 1.5
			sol.sinir_z -= 1.5
			i += 1 
		pass
