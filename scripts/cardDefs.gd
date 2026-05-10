extends Node

var d = {
	"Blank":{
		"image": PlaceholderTexture2D.new(), 
		"func": func(x: float, foo: bool) -> float:
	return x
	},
	"Fire 1":{
		"image":load("res://assets/Fire1.png"),
		"func": func(x: float, foo: bool) -> float:
	return x*3 if foo else x*1.5
	
	},
	"Water 1":{
		"image":load("res://assets/Water1.png"),
		"func": func(x: float, foo: bool) -> float:
	return x*3 if foo else x*1.5
	},
	"Add 2":{
		"image":load("res://assets/Add2.png"),
		"func": func(x: float, foo: bool) -> float:
	return x+2
	},
}
