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
	print(sideYs)
	print(sideYs.max())
	val = sideYs.find( sideYs.max() )

func getVal() -> int:
	return val
