class_name Dice extends RigidBody3D

var teamId = 0
var val = 0

func setTop():
	var sideYs = [
		$"side/1".global_position.y,
		$"side/2".global_position.y,
		$"side/3".global_position.y,
		$"side/4".global_position.y,
		$"side/5".global_position.y,
		$"side/6".global_position.y,
		]
	val = sideYs.find( sideYs.max() )

func getVal() -> float:
	return val
	
func getTeamId() -> int:
	return teamId
	
func setTeamId(team):
	teamId = team
	var material = $side.get_active_material(0).duplicate()
	material.albedo_color = Global.teamColors[team]
	$side.set_surface_override_material(0, material)
